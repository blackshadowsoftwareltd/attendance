use std::sync::OnceLock;

use sqlx::SqlitePool;

pub static DB: OnceLock<SqlitePool> = OnceLock::new();
