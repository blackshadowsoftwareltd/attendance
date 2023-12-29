use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct LeaveDetails {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub user_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub leave_id: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub leave_time: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub leave_reason: Option<String>,
}

impl LeaveDetails {
    pub fn with_leave_id(self, leave_id: Option<i64>) -> Self {
        Self { leave_id, ..self }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait LeaveDetailsList {
    fn to_json(self) -> String;
    fn where_user_id(self, id: i64) -> Option<LeaveDetails>;
    fn where_leave_id(self, id: i64) -> Option<LeaveDetails>;
}
impl LeaveDetailsList for Vec<LeaveDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
    fn where_user_id(self, id: i64) -> Option<LeaveDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.user_id.unwrap() == id)
            .collect::<Vec<LeaveDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
    fn where_leave_id(self, id: i64) -> Option<LeaveDetails> {
        let r = self
            .into_iter()
            .filter(|e| e.leave_id.unwrap() == id)
            .collect::<Vec<LeaveDetails>>();

        if r.len() > 0 {
            Some(r[0].clone())
        } else {
            None
        }
    }
}
