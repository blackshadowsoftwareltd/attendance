use anyhow::Result;

use crate::utils::lock::DB;

pub async fn drop_table(table_name: &str) -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!("DROP TABLE {table_name}");
        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Dropped table {}", table_name);
    }
    Ok(())
}
