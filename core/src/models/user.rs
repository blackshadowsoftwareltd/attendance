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
    fn get_user_by_id(self, id: i64) -> Option<User>;
}
impl UserList for Vec<User> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }

    fn get_user_by_id(self, id: i64) -> Option<User> {
        let users = self
            .iter()
            .filter(|u| u.user_id.unwrap() == id)
            .collect::<Vec<&User>>()
            .clone();
        if users.len() > 0 {
            Some(users[0].clone())
        } else {
            None
        }
    }
}
