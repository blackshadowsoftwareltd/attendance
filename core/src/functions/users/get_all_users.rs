use axum::{http::StatusCode, Json};

use crate::{
    db::read::read_users_db,
    models::{error::ErrorReason, user::UserList},
};

pub async fn get_all_users() -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : get_all_users");
    match read_users_db().await {
        Ok(users) => {
            println!("{} Users", users.len());
            (StatusCode::OK, Ok(users.to_json()))
        }
        Err(e) => {
            println!("Error getting users: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
