use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct CheckIn {
    pub user_id: Option<i64>,
    pub check_in_id: Option<i64>,
    pub check_in_time: Option<String>,
}

impl CheckIn {
    pub fn with_id(self, check_in_id: Option<i64>) -> Self {
        Self {
            check_in_id,
            ..self
        }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait CheckInList {
    fn to_json(self) -> String;
}
impl CheckInList for Vec<CheckIn> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
