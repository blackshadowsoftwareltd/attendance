use anyhow::Result;
use sqlx::{sqlite::SqlitePoolOptions, Pool, Sqlite};
use std::path::PathBuf;
use tokio::fs::File;

use crate::{db::create_table::create_user_table, utils::lock::DB};

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

    create_user_table().await?;

    Ok(db)
}
