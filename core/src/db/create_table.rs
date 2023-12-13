use anyhow::Result;

use crate::utils::{constants::sql_command::*, lock::DB};

pub async fn create_user_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {USERS} (
            {USER_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {NAME} {VARCHAR},
            {EMAIL} {VARCHAR} {UNIQUE},
            {PASSWARD} {VARCHAR} {NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table users")
    }
    Ok(())
}
