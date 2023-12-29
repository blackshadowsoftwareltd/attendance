use axum::{
    routing::{get, post, put},
    Router,
};

use crate::functions::{
    breaks::{break_off::break_off, take_break::take_break},
    entry::{checkin_checkout::checkin_checkout, get_all_checkins::get_all_checkins},
    leave::{get_all_leaves::get_all_leaves, leave::add_leave},
    root::root,
    users::{
        add_user::add_user, get_all_users::get_all_users, get_user::get_user,
        remove_users::remove_users, update_user::update_user,
    },
};

pub async fn routes() -> Router {
    Router::new()
        .route("/", get(root))
        .route("/user", get(get_user))
        .route("/users", get(get_all_users))
        .route("/get_all_checkins", get(get_all_checkins))
        .route("/remove_users", post(remove_users))
        .route("/add_user", post(add_user))
        .route("/update_user", put(update_user))
        .route("/checkin_checkout", post(checkin_checkout))
        .route("/take_break", post(take_break))
        .route("/break_off", post(break_off))
        .route("/get_all_leaves", get(get_all_leaves))
        .route("/add_leave", post(add_leave))
}
