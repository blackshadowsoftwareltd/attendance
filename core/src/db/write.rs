use anyhow::Result;

use crate::{models::user::User, utils::lock::DB};

pub async fn add_user_db(user: User) -> Result<()> {
    let pool = DB.get().unwrap();
    let q = format!(
        "INSERT INTO users (name, email,password) VALUES ({:?}, {:?},{:?})",
        user.name, user.email, user.password
    );
    sqlx::query(q.as_str()).execute(pool).await?;
    Ok(())
}
