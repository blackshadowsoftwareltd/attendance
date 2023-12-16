use axum::{http::StatusCode, Json};

use crate::{
    db::write::add_user_db,
    models::{error::ErrorReason, user::User},
};

pub async fn add_user(
    Json(payload): Json<User>,
) -> (StatusCode, Result<Json<User>, Json<ErrorReason>>) {
    println!("route : add_user");
    match add_user_db(payload.clone()).await {
        Ok(id) => {
            println!("User added successfully");
            (StatusCode::CREATED, Ok(Json(payload.with_id(Some(id)))))
        }
        Err(e) => {
            println!("Error adding user: {}", e);
            ErrorReason::user_create_bad_request(e.to_string())
        }
    }
}
