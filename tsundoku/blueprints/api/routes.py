import logging
from typing import Optional

from quart import Blueprint
from quart import current_app as app
from quart import request
from quart_auth import current_user

from tsundoku.manager import Show

from .entries import EntriesAPI
from .nyaa import NyaaAPI
from .response import APIResponse
from .shows import ShowsAPI
from .webhookbase import WebhookBaseAPI
from .webhooks import WebhooksAPI

api_blueprint = Blueprint('api', __name__, url_prefix="/api/v1")
logger = logging.getLogger("tsundoku")


@api_blueprint.before_request
async def ensure_auth() -> Optional[APIResponse]:
    authed = False
    if request.headers.get("Authorization"):
        token = request.headers["Authorization"]
        async with app.db_pool.acquire() as con:
            try:
                user = await con.fetchval("""
                    SELECT
                        id
                    FROM
                        users
                    WHERE
                        api_key=$1;
                """, token)

                if user:
                    authed = True
            except Exception:
                pass
    if not authed and await current_user.is_authenticated:
        authed = True

    if not authed:
        return APIResponse(
            status=401,
            result="You are not authorized to access this resource."
        )

    return None


@api_blueprint.route("/shows/seen", methods=["GET"])
async def get_seen_shows() -> APIResponse:
    """
    Returns a list of distinct titles that the Tsundoku
    poller task has seen while parsing the enabled RSS feeds.

    .. :quickref: Shows; Retrieves seen shows.

    :returns: List[:class:`str`]
    """
    return APIResponse(
        result=list(app.seen_titles)
    )


@api_blueprint.route("/shows/check", methods=["GET"])
async def check_for_releases() -> APIResponse:
    """
    Forces Tsundoku to check all enabled RSS feeds for new
    title releases.

    .. note::
        The first int in the tuple is the show ID
        and the second int is the ID of the new entry.

    .. :quickref: Shows; Checks for new releases.

    :returns: List[Tuple(:class:`int`, :class:`int`)]
    """
    logger.info("API - Force New Releases Check")

    found_items = await app.poller.poll()

    return APIResponse(
        result=found_items
    )


@api_blueprint.route("/shows/<int:show_id>/cache", methods=["DELETE"])
async def delete_show_cache(show_id: int) -> APIResponse:
    """
    Force Tsundoku to delete the metadata cache for a show.

    .. :quickref: Shows; Deletes show metadata.
    """
    logger.info(f"API - Deleting cache for Show {show_id}")

    show = await Show.from_id(show_id)
    await show.metadata.clear_cache()
    await show.refetch()

    return APIResponse(
        result=show.to_dict()
    )


def setup_views() -> None:
    # Setup ShowsAPI URL rules.
    shows_view = ShowsAPI.as_view("shows_api")

    api_blueprint.add_url_rule(
        "/shows",
        defaults={
            "show_id": None
        },
        view_func=shows_view,
        methods=["GET", "POST"]
    )
    api_blueprint.add_url_rule(
        "/shows/<int:show_id>",
        view_func=shows_view,
        methods=["GET", "PUT", "DELETE"]
    )

    # Setup EntriesAPI URL rules.
    entries_view = EntriesAPI.as_view("entries_api")

    api_blueprint.add_url_rule(
        "/shows/<int:show_id>/entries",
        defaults={
            "entry_id": None
        },
        view_func=entries_view,
        methods=["GET", "POST"]
    )
    api_blueprint.add_url_rule(
        "/shows/<int:show_id>/entries/<int:entry_id>",
        view_func=entries_view,
        methods=["GET", "DELETE"]
    )

    # Setup WebhooksAPI URL rules.
    webhooks_view = WebhooksAPI.as_view("webhooks_api")

    api_blueprint.add_url_rule(
        "/shows/<int:show_id>/webhooks",
        view_func=webhooks_view,
        methods=["GET"]
    )
    api_blueprint.add_url_rule(
        "/shows/<int:show_id>/webhooks/<int:base_id>",
        view_func=webhooks_view,
        methods=["PUT"]
    )

    # Setup WebhookBaseAPI URL rules.
    webhookbase_view = WebhookBaseAPI.as_view("webhookbase_api")

    api_blueprint.add_url_rule(
        "/webhooks",
        view_func=webhookbase_view,
        methods=["GET", "POST"]
    )
    api_blueprint.add_url_rule(
        "/webhooks/<int:base_id>",
        view_func=webhookbase_view,
        methods=["GET", "PUT", "DELETE"]
    )

    # Setup NyaaAPI URL rules.
    nyaa_view = NyaaAPI.as_view("nyaa_api")

    api_blueprint.add_url_rule(
        "/nyaa",
        view_func=nyaa_view,
        methods=["GET", "POST"]
    )


setup_views()
