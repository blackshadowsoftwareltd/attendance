use axum::{http::StatusCode, Json};

use crate::{
    db::write::add_break_db,
    models::{breaks::BreakDetails, error::ErrorReason},
};

pub async fn add_breaks(
    Json(payload): Json<BreakDetails>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : add_breaks");
    match add_break_db(payload.clone()).await {
        Ok(id) => {
            println!("Break added successfully");
            (
                StatusCode::CREATED,
                Ok(payload.with_break_id(Some(id)).to_json()),
            )
        }
        Err(e) => {
            println!("Error adding Break: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
