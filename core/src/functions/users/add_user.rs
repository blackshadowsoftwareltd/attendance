use axum::{http::StatusCode, Json};

use crate::{
    db::write::add_user_db,
    models::{error::ErrorReason, user::User},
};

pub async fn add_user(
    Json(payload): Json<User>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : add_user");
    match add_user_db(payload.clone()).await {
        Ok(id) => {
            println!("User added successfully");
            (
                StatusCode::CREATED,
                Ok(payload.skip_pass().with_id(Some(id)).to_json()),
            )
        }
        Err(e) => {
            println!("Error adding user: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
