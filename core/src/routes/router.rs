use axum::{
    routing::{get, post, put},
    Router,
};

use crate::functions::{
    breaks::{breaks::add_breaks, get_all_breaks::get_all_breaks},
    entry::{checkin_checkout::checkin_checkout, get_all_checkins::get_all_checkins},
    leave::{get_all_leaves::get_all_leaves, leave::add_leave},
    root::root,
    signin::signin::signin,
    users::{
        add_user::add_user, get_all_users::get_all_users, get_user::get_user,
        remove_users::remove_users, update_user::update_user,
    },
};

pub async fn routes() -> Router {
    Router::new()
        // * GET
        .route("/", get(root))
        .route("/user", get(get_user))
        .route("/users", get(get_all_users))
        .route("/get_all_breaks", get(get_all_breaks))
        .route("/get_all_leaves", get(get_all_leaves))
        .route("/get_all_checkins", get(get_all_checkins))
        // * POST
        .route("/add_user", post(add_user))
        .route("/add_leave", post(add_leave))
        .route("/signin", post(signin))
        .route("/add_breaks", post(add_breaks))
        .route("/remove_users", post(remove_users))
        .route("/checkin_checkout", post(checkin_checkout))
        // * PUT
        .route("/update_user", put(update_user))
}
