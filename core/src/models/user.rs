use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct User {
    pub user_id: i32,
    pub name: String,
    pub email: String,
    #[sqlx(default)] // for optional fields to read db
    pub password: Option<String>,
}
