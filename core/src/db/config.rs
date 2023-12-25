use anyhow::Result;
use sqlx::{sqlite::SqlitePoolOptions, Pool, Sqlite};
use std::path::PathBuf;
use tokio::fs::File;

use crate::utils::lock::DB;

use super::create_table::{create_check_in_table, create_check_out_table, create_user_table};

pub async fn db_config() -> Result<Pool<Sqlite>> {
    let path = PathBuf::from("../attendance.db");
    println!("{:}", path.exists());
    if !path.exists() {
        _ = File::create(path.clone()).await?;
    }
    println!("{:}", path.exists());

    // let conn = SqliteConnection::connect("sqlite::memory:").await?;
    let db = SqlitePoolOptions::new()
        .connect(format!("sqlite://{}", path.to_str().unwrap()).as_str())
        .await?;

    DB.get_or_init(|| db.clone());
    create_tables().await.unwrap();

    Ok(db)
}

pub async fn create_tables() -> Result<()> {
    create_user_table().await?;
    create_check_in_table().await?;
    create_check_out_table().await?;
    Ok(())
}
