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
