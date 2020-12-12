import json
import os

from argon2 import PasswordHasher
from argon2.exceptions import VerifyMismatchError
from quart import abort, Blueprint, flash, render_template, redirect, url_for
from quart import current_app as app
from quart import request
from quart_auth import AuthUser, current_user, login_user, logout_user, login_required

from tsundoku.kitsu import KitsuManager
from tsundoku.blueprints.api.webhooks import get_webhook_record
from tsundoku.git import update, check_for_updates
from tsundoku.user import User


ux_blueprint = Blueprint(
    'ux',
    __name__,
    template_folder="templates",
    static_folder="static",
    static_url_path="/ux/static"
)
hasher = PasswordHasher()

status_html_map = {
    "current": "<span class='img-overlay-span tag is-success'>Airing</span>",
    "finished": "<span class='img-overlay-span tag is-danger'>Finished</span>",
    "tba": "<span class='img-overlay-span tag is-warning'>TBA</span>",
    "unreleased": "<span class='img-overlay-span tag is-info'>Unreleased</span>",
    "upcoming": "<span class='img-overlay-span tag is-primary'>Upcoming</span>"
}


@ux_blueprint.context_processor
def update_context():
    return {
        "updates": app.update_info,
        "docker": os.environ.get("IS_DOCKER", False)
    }


@ux_blueprint.route("/", methods=["GET"])
@login_required
async def index():
    kwargs = {}
    async with app.db_pool.acquire() as con:
        shows = await con.fetch("""
            SELECT
                id,
                title,
                desired_format,
                desired_folder,
                season,
                episode_offset
            FROM
                shows
            ORDER BY title;
        """)
        shows = [dict(s) for s in shows]
        for s in shows:
            entries = await con.fetch("""
                SELECT
                    id,
                    show_id,
                    episode,
                    current_state
                FROM
                    show_entry
                WHERE show_id=$1
                ORDER BY episode ASC;
            """, s["id"])
            s["entries"] = [dict(e) for e in entries]

            manager = await KitsuManager.from_show_id(s["id"])
            if manager:
                status = await manager.get_status()
                if status:
                    s["status"] = status_html_map[status]
                s["kitsu_id"] = manager.kitsu_id
                s["webhooks"] = await get_webhook_record(show_id=s["id"])
                s["image"] = await manager.get_poster_image()
                s["link"] = manager.link

    kwargs["shows"] = shows
    kwargs["seen_titles"] = list(app.seen_titles)

    if not len(app.rss_parsers):
        await flash("No RSS parsers installed.")
    elif not len(app.seen_titles):
        await flash("No shows found, is there an error with your parsers?")

    return await render_template("index.html", **kwargs)


@ux_blueprint.route("/update", methods=["GET", "POST"])
@login_required
async def update_():
    if request.method == "GET":
        check_for_updates()
    else:
        await update()

    return redirect(url_for("ux.index"))


@ux_blueprint.route("/login", methods=["GET", "POST"])
async def login():
    if await current_user.is_authenticated:
        return redirect(url_for("ux.index"))

    if request.method == "GET":
        return await render_template("login.html")
    else:
        form = await request.form

        username = form.get("username")
        password = form.get("password")
        if username is None or password is None:
            return abort(400, "Login Form missing required data.")

        async with app.db_pool.acquire() as con:
            user_data = await con.fetchrow("""
                SELECT
                    id,
                    password_hash
                FROM
                    users
                WHERE LOWER(username) = $1;
            """, username.lower())

        if not user_data:
            return abort(401, "Invalid username and password combination.")

        try:
            hasher.verify(user_data["password_hash"], password)
        except VerifyMismatchError:
            return abort(401, "Invalid username and password combination.")

        if hasher.check_needs_rehash(user_data["password_hash"]):
            async with app.db_pool.acquire() as con:
                await con.execute("""
                    UPDATE
                        users
                    SET
                        password_hash=$1
                    WHERE username=$2;
                """, hasher.hash(password), username)

        remember = form.get("remember", False)

        login_user(User(user_data["id"]), remember=remember)

        return redirect(url_for("ux.index"))


@ux_blueprint.route("/logout", methods=["GET"])
@login_required
async def logout():
    logout_user()
    return redirect(url_for("ux.index"))
