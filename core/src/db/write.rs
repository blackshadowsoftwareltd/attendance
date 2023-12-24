use crate::models::check_in::CheckIn;
use crate::utils::constants::sql_command::*;
use crate::{models::user::User, utils::lock::DB};
use anyhow::Result;

pub async fn add_user_db(user: User) -> Result<i64, String> {
    let pool = DB.get().unwrap();
    let q = format!(
        "{INSERT_INTO} {USERS} ({NAME}, {EMAIL},{PASSWARD}) {VALUES} ({:?}, {:?},{:?})",
        user.name,
        user.email,
        user.password.unwrap()
    );
    match sqlx::query(q.as_str()).execute(pool).await {
        Ok(r) => {
            let id = r.last_insert_rowid();
            println!("User added successfully. ID : {:?}", id);
            Ok(id)
        }
        Err(e) => Err(format!(
            "Error adding user: {}",
            e.as_database_error().unwrap().message()
        )),
    }
}

pub async fn add_check_in_db(checkin: CheckIn) -> Result<i64, String> {
    let pool = DB.get().unwrap();
    let q = format!(
        "{INSERT_INTO} {CHECKIN} ({USER_ID}, {CHECK_IN_TIME}) {VALUES} (?, ?)",
      
    );
    println!("0");
    match sqlx::query(q.as_str())
        .bind(checkin.user_id.unwrap())
        .bind(checkin.check_in_time.unwrap())
        .execute(pool)
        .await
    {
        Ok(r) => {
            println!("1");
            let id = r.last_insert_rowid();
            println!("Entry added successfully. ID : {:?}", id);
            Ok(id)
        }
        Err(e) => Err(format!(
            "Error adding Entry: {}",
            e.as_database_error().unwrap().message()
        )),
    }
}
