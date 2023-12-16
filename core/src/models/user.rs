use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct User {
    pub user_id: Option<i64>,
    pub name: String,
    pub email: String,
    #[sqlx(default)] // for optional fields to read db
    pub password: Option<String>,
}

impl User {
    pub fn with_id(self, user_id: Option<i64>) -> Self {
        Self { user_id, ..self }
    }
}
