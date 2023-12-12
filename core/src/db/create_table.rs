use anyhow::Result;

use crate::utils::{
    constants::sql_command::{AUTO_INCREMENT, CREATE_TABLE, IF_NOT_EXISTS, PRIMARY_KEY, VARCHAR},
    lock::DB,
};

pub async fn create_user_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} users (
            user_id SERIAL {PRIMARY_KEY} {AUTO_INCREMENT},
            name {VARCHAR},
            email {VARCHAR},
            password {VARCHAR}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table users")
    }
    Ok(())
}
