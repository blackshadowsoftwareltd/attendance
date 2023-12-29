use axum::{http::StatusCode, Json};

use crate::{
    db::write::add_leave_db,
    models::{error::ErrorReason, leave::LeaveDetails},
};

pub async fn add_leave(
    Json(payload): Json<LeaveDetails>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : add_leave");
    match add_leave_db(payload.clone()).await {
        Ok(id) => {
            println!("Leave added successfully");
            (
                StatusCode::CREATED,
                Ok(payload.with_leave_id(Some(id)).to_json()),
            )
        }
        Err(e) => {
            println!("Error adding Checkin: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
