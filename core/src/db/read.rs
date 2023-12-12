use crate::{models::user::User, utils::lock::DB};
use anyhow::Result;
use sqlx::{self, sqlite::Sqlite};

pub async fn read_users_db() -> Result<Vec<User>> {
    let pool = DB.get().unwrap();
    let users = sqlx::query_as::<Sqlite, User>("Select * from users")
        .fetch_all(pool)
        .await?;

    Ok(users)
}
