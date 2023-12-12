use anyhow::Result;
use sqlx::{sqlite::SqlitePoolOptions, Pool, Sqlite};
use std::path::PathBuf;
use tokio::fs::File;

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
    Ok(db)
}
