use crate::models::check_in::CheckIn;
use crate::models::check_out::CheckOut;
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

pub async fn read_check_ins_db() -> Result<Vec<CheckIn>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKIN}");

    let checkins = sqlx::query_as::<Sqlite, CheckIn>(q.as_str())
        .fetch_all(pool)
        .await?;
    Ok(checkins)
}

pub async fn read_check_outs_db() -> Result<Vec<CheckOut>> {
    let pool = DB.get().unwrap();
    let q = format!("Select * from {CHECKOUT}");

    let checkouts = sqlx::query_as::<Sqlite, CheckOut>(q.as_str())
        .fetch_all(pool)
        .await?;
    Ok(checkouts)
}
