use axum::{http::StatusCode, Json};

use crate::{
    db::read::{read_breaks_db, read_users_db},
    models::{
        breaks::BreakDetails,
        error::ErrorReason,
        user::UserList,
        user_details::{UserDetails, UserDetailsList},
    },
};

pub async fn get_all_breaks() -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : get_all_breaks");

    match read_users_db().await {
        Ok(users) => {
            let mut users_details = vec![];
            let breaks: Vec<BreakDetails> = read_breaks_db().await.unwrap();
            for b in breaks.into_iter() {
                let user_info = users.clone().get_user_by_id(b.user_id.clone().unwrap());

                let x = UserDetails {
                    user_info,
                    breaks: Some(b),
                    leave: None,
                    checkin: None,
                    checkout: None,
                };
                users_details.push(x);
            }

            (StatusCode::OK, Ok(users_details.to_json()))
        }
        Err(e) => {
            println!("Error getting breaks: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
