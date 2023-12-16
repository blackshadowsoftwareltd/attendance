use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct User {
    pub user_id: Option<i64>,
    pub name: String,
    pub email: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub password: Option<String>,
}

impl User {
    pub fn with_id(self, user_id: Option<i64>) -> Self {
        Self { user_id, ..self }
    }
    pub fn skip_pass(self) -> Self {
        Self {
            password: None,
            ..self
        }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait UserList {
    fn to_json(self) -> String;
}
impl UserList for Vec<User> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
