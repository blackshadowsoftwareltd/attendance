use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct EntryDetails {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub user_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub check_in_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub check_out_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub check_in_time: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub check_out_time: Option<String>,
}

impl EntryDetails {
    pub fn with_check_in_id(self, check_in_id: Option<i64>) -> Self {
        Self {
            check_in_id,
            ..self
        }
    }
    pub fn with_check_out_id(self, check_out_id: Option<i64>) -> Self {
        Self {
            check_out_id,
            ..self
        }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait EntryDetailsList {
    fn to_json(self) -> String;
}
impl EntryDetailsList for Vec<EntryDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
