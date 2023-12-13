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

    Ok(users)
}
