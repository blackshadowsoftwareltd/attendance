use axum::{http::StatusCode, Json};

use crate::{
    db::write::add_entry_db,
    models::{check_in::CheckIn, error::ErrorReason},
};

pub async fn checkin_checkout(
    Json(payload): Json<CheckIn>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : checkin_checkout");
    match payload.user_id {
        Some(_) => match add_entry_db(payload.clone()).await {
            Ok(id) => {
                println!("Entry added successfully");
                (StatusCode::CREATED, Ok(payload.with_id(Some(id)).to_json()))
            }
            Err(e) => {
                println!("Error adding entry: {}", e);
                ErrorReason::bad_request(e.to_string())
            }
        },
        None => ErrorReason::bad_request("Checkout Process not implemented yet".to_string()),
    }
}
