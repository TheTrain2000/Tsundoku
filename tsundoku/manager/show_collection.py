from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List

import aiohttp
from quart import current_app as app

from .kitsu import API_URL
from .show import Show


@dataclass
class ShowCollection:
    _shows: List[Show]

    def to_list(self) -> List[dict]:
        """
        Serializes all of the Shows in the collection
        to a list.

        Returns
        -------
        List[dict]
            List of serialized Shows.
        """
        return [s.to_dict() for s in self._shows]

    @classmethod
    async def all(cls) -> ShowCollection:
        """
        Retrieves a collection of all Show
        objects presently stored in the database.

        Returns
        -------
        ShowCollection
            Collection of all shows.
        """
        async with app.acquire_db() as con:
            await con.execute("""
                SELECT
                    id as id_,
                    title,
                    desired_format,
                    desired_folder,
                    season,
                    episode_offset,
                    created_at
                FROM
                    shows
                ORDER BY title;
            """)
            shows = await con.fetchall()

        _shows = [await Show.from_data(show) for show in shows]
        instance = cls(
            _shows=_shows
        )
        return instance

    async def gather_statuses(self) -> None:
        """
        Gathers the status for all of the shows
        in the collection.

        The status is an attribute that is assigned
        on each Show's metadata object.
        """
        managers = [s.metadata for s in self._shows if await s.metadata.should_update_status()]

        if not managers:
            return

        status_map: Dict[int, str] = {}
        async with aiohttp.ClientSession() as sess:
            payload = {
                "filter[id]": ",".join(map(str, [m.kitsu_id for m in managers])),
                "fields[anime]": "status"
            }
            async with sess.get(API_URL, params=payload) as resp:
                data = await resp.json()
                for show in data.get("data", []):
                    show_id = int(show["id"])
                    status = show.get("attributes", {}).get("status", None)
                    status_map[show_id] = status

        for manager in managers:
            if manager.kitsu_id in status_map:
                await manager.set_status(status_map[manager.kitsu_id])
