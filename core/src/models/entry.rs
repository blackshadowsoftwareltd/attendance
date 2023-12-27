use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct EntryDetails {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub user_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub check_in_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub check_out_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub check_in_time: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
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
    fn where_user_id(self, id: i64) -> Option<EntryDetails>;
    fn where_check_in_id(self, id: i64) -> Option<EntryDetails>;
}
impl EntryDetailsList for Vec<EntryDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
    fn where_user_id(self, id: i64) -> Option<EntryDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.user_id.unwrap() == id)
            .collect::<Vec<EntryDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
    fn where_check_in_id(self, id: i64) -> Option<EntryDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.check_in_id.unwrap() == id)
            .collect::<Vec<EntryDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
}
