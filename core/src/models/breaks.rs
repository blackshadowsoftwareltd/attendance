use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct BreakDetails {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub user_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub break_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub start_at: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub end_at: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub break_reason: Option<String>,
}

impl BreakDetails {
    pub fn with_break_id(self, break_id: Option<i64>) -> Self {
        Self { break_id, ..self }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait BreakDetailsList {
    fn to_json(self) -> String;
    fn where_user_id(self, id: i64) -> Option<BreakDetails>;
    fn where_break_id(self, id: i64) -> Option<BreakDetails>;
}
impl BreakDetailsList for Vec<BreakDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
    fn where_user_id(self, id: i64) -> Option<BreakDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.user_id.unwrap() == id)
            .collect::<Vec<BreakDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
    fn where_break_id(self, id: i64) -> Option<BreakDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.break_id.unwrap() == id)
            .collect::<Vec<BreakDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
}
