use axum::{http::StatusCode, Json};

use crate::{
    db::read::{read_check_ins_db, read_check_out_info_db, read_users_db},
    models::{
        entry::EntryDetails,
        error::ErrorReason,
        user::UserList,
        user_details::{UserDetails, UserDetailsList},
    },
};

pub async fn get_all_checkins() -> (StatusCode, Result<String, Json<ErrorReason>>) {
    println!("route : get_all_checkins");

    match read_users_db().await {
        Ok(users) => {
            let mut users_details = vec![];
            let check_ins: Vec<EntryDetails> = read_check_ins_db().await.unwrap();
            for c in check_ins.into_iter() {
                // let users = u.clone();
                let user_info = users.clone().get_user_by_id(c.user_id.unwrap());
                let checkouts = read_check_out_info_db(c.check_in_id.unwrap())
                    .await
                    .unwrap();

                let checkout = if checkouts.len() == 0 {
                    None
                } else {
                    Some(checkouts[0].clone())
                };
                let x = UserDetails {
                    user_info,
                    checkin: Some(c.clone()),
                    checkout,
                    leave: None,
                };
                users_details.push(x);
            }

            (StatusCode::OK, Ok(users_details.to_json()))
        }
        Err(e) => {
            println!("Error adding user: {}", e);
            ErrorReason::bad_request(e.to_string())
        }
    }
}
