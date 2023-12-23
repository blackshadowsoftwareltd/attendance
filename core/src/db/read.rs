use crate::models::check_in::CheckIn;
use crate::utils::constants::sql_command::*;
use crate::{models::user::User, utils::lock::DB};
use anyhow::Result;
use sqlx::{self, sqlite::Sqlite};

pub async fn read_users_db() -> Result<Vec<User>> {
    let pool = DB.get().unwrap();
    let q = format!("Select {USER_ID},{NAME},{EMAIL} from {USERS}");

    let users = sqlx::query_as::<Sqlite, User>(q.as_str())
        .fetch_all(pool)
        .await?;
    // println!("users: {:?}", users);
    Ok(users)
}

pub async fn read_entries_db() -> Result<Vec<CheckIn>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {ENTRY}");

    let entries = sqlx::query_as::<Sqlite, CheckIn>(q.as_str())
        .fetch_all(pool)
        .await?;
    // println!("users: {:?}", users);
    Ok(entries)
}
