use axum::{http::StatusCode, Json};

use crate::{
    db::read::{read_leaves_db, read_users_db},
    models::{
        error::ErrorReason,
        leave::LeaveDetails,
        user::UserList,
        user_details::{UserDetails, UserDetailsList},
    },
};

pub async fn get_all_leaves() -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : get_all_leaves");

    match read_users_db().await {
        Ok(users) => {
            let mut users_details = vec![];
            let leaves: Vec<LeaveDetails> = read_leaves_db().await.unwrap();
            for l in leaves.into_iter() {
                // let users = u.clone();
                let user_info = users.clone().get_user_by_id(l.user_id.clone().unwrap());

                let x = UserDetails {
                    user_info,
                    leave: Some(l),
                    checkin: None,
                    checkout: None,
                };
                users_details.push(x);
            }

            (StatusCode::OK, Ok(users_details.to_json()))
        }
        Err(e) => {
            println!("Error getting leaves: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
