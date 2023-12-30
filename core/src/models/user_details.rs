use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

use super::{breaks::BreakDetails, entry::EntryDetails, leave::LeaveDetails, user::User};

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct UserDetails {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub user_info: Option<User>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub checkin: Option<EntryDetails>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub checkout: Option<EntryDetails>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub leave: Option<LeaveDetails>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub breaks: Option<BreakDetails>,
}

pub trait UserDetailsList {
    fn to_json(self) -> String;
}
impl UserDetailsList for Vec<UserDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
