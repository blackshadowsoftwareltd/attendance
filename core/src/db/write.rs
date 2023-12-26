use crate::models::entry::EntryDetails;
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

pub async fn add_check_in_db(checkin: EntryDetails) -> Result<i64, String> {
    let pool = DB.get().unwrap();
    let q = format!("{INSERT_INTO} {CHECKIN} ({USER_ID}, {CHECK_IN_TIME}) {VALUES} (?, ?)",);

    match sqlx::query(q.as_str())
        .bind(checkin.user_id.unwrap())
        .bind(checkin.check_in_time.unwrap())
        .execute(pool)
        .await
    {
        Ok(r) => {
            let id = r.last_insert_rowid();
            println!("Checkin added successfully. ID : {:?}", id);
            Ok(id)
        }
        Err(e) => Err(format!(
            "Error adding Checkin: {}",
            e.as_database_error().unwrap().message()
        )),
    }
}

pub async fn add_check_out_db(checkout: EntryDetails) -> Result<i64, String> {
    let pool = DB.get().unwrap();
    let q = format!("{INSERT_INTO} {CHECKOUT} ({CHECK_IN_ID}, {CHECK_OUT_TIME}) {VALUES} (?, ?)",);

    match sqlx::query(q.as_str())
        .bind(checkout.check_in_id.unwrap())
        .bind(checkout.check_out_time.unwrap())
        .execute(pool)
        .await
    {
        Ok(r) => {
            let id = r.last_insert_rowid();
            println!("Checkout added successfully. ID : {:?}", id);
            Ok(id)
        }
        Err(e) => Err(format!(
            "Error adding Checkout: {}",
            e.as_database_error().unwrap().message()
        )),
    }
}
