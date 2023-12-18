use axum::{
    routing::{get, post, put},
    Router,
};

use crate::functions::{
    add_user::add_user, break_off::break_off, checkin_checkout::checkin_checkout,
    get_all_users::get_all_users, get_user::get_user, remove_users::remove_users, root::root,
    take_break::take_break, update_user::update_user,
};

pub async fn routes() -> Router {
    Router::new()
        .route("/", get(root))
        .route("/user", get(get_user))
        .route("/users", get(get_all_users))
        .route("/remove_users", post(remove_users))
        .route("/add_user", post(add_user))
        .route("/update_user", put(update_user))
        .route("/checkin_checkout", post(checkin_checkout))
        .route("/take_break", post(take_break))
        .route("/break_off", post(break_off))
}
