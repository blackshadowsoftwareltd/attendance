use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct User {
    pub user_id: i32,
    pub name: String,
    pub email: String,
    pub password: String,
}
