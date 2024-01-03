use axum::{http::StatusCode, Json};

use crate::{
    db::read::signin_db,
    models::{
        error::ErrorReason,
        user::{User, UserList},
    },
};

pub async fn signin(Json(payload): Json<User>) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : signin");

    match signin_db(payload.email, payload.password.unwrap()).await {
        Ok(users) => {
            println!("{} Users", users.len());
            match users.is_empty() {
                true => ErrorReason::bad_request("Invalid Email or Password".to_string()),
                false => (StatusCode::OK, Ok(users.to_json())),
            }
        }
        Err(e) => {
            println!("Error getting users: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
