use crate::utils::lock::DB;
use anyhow::Result;

pub async fn drop_table(table_name: &str) -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!("DROP TABLE {table_name}");
        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Dropped table {}", table_name);
    }
    Ok(())
}

// #[cfg(test)]
pub async fn drop_table_tes() {
    use super::config::db_config;

    match db_config().await {
        Ok(_) => {
            // drop_table("{USERS}").await.unwrap();
            drop_table("{ENTRY}").await.unwrap();
        }
        Err(e) => {
            println!("{:?}", e);
        }
    }
}
