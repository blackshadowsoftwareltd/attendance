use crate::models::entry::EntryDetails;
use crate::models::leave::LeaveDetails;
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

pub async fn read_check_ins_db() -> Result<Vec<EntryDetails>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKIN}");

    let checkins = sqlx::query_as::<Sqlite, EntryDetails>(q.as_str())
        .fetch_all(pool)
        .await?;
    Ok(checkins)
}

pub async fn read_check_outs_db() -> Result<Vec<EntryDetails>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKOUT}");

    let checkouts = sqlx::query_as::<Sqlite, EntryDetails>(q.as_str())
        .fetch_all(pool)
        .await?;
    Ok(checkouts)
}

pub async fn read_check_in_info_db(id: i64) -> Result<Vec<EntryDetails>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKIN} where {USER_ID} = ?");

    let checkins = sqlx::query_as::<Sqlite, EntryDetails>(q.as_str())
        .bind(id)
        .fetch_all(pool)
        .await?;
    Ok(checkins)
}

pub async fn read_check_out_info_db(id: i64) -> Result<Vec<EntryDetails>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKOUT} where {CHECK_IN_ID} = ?");

    let checkouts = sqlx::query_as::<Sqlite, EntryDetails>(q.as_str())
        .bind(id)
        .fetch_all(pool)
        .await?;
    Ok(checkouts)
}

pub async fn read_leaves_db() -> Result<Vec<LeaveDetails>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {LEAVE}");

    let checkins = sqlx::query_as::<Sqlite, LeaveDetails>(q.as_str())
        .fetch_all(pool)
        .await?;
    Ok(checkins)
}
