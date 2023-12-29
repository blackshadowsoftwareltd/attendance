use axum::{http::StatusCode, Json};

use crate::{db::remove::remove_users_db, extensions::vec::VecExt, models::error::ErrorReason};

pub async fn remove_users(
    Json(payload): Json<Vec<i64>>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : remove users");
    match remove_users_db(payload.clone()).await {
        Ok(_) => {
            println!("Users remove successfully");
            (StatusCode::OK, Ok(payload.to_json()))
        }
        Err(e) => {
            println!("Error removing users: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
