use axum::{http::StatusCode, Json};

use crate::{
    db::write::{add_check_in_db, add_check_out_db},
    models::{entry::EntryDetails, error::ErrorReason},
};

pub async fn checkin_checkout(
    Json(payload): Json<EntryDetails>,
) -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : checkin_checkout");
    match payload.user_id {
        Some(_) => match add_check_in_db(payload.clone()).await {
            Ok(id) => {
                println!("Entry added successfully");
                (
                    StatusCode::CREATED,
                    Ok(payload.with_check_in_id(Some(id)).to_json()),
                )
            }
            Err(e) => {
                println!("Error adding Checkin: {}", e);
                ErrorReason::bad_request(e.to_string())
            }
        },
        None => match add_check_out_db(payload.clone()).await {
            Ok(id) => {
                println!("Checkout added successfully");
                (
                    StatusCode::CREATED,
                    Ok(payload.with_check_out_id(Some(id)).to_json()),
                )
            }
            Err(e) => {
                println!("Error adding Checkout: {}", e);
                ErrorReason::bad_request(e.to_string())
            }
        },
    }
}
