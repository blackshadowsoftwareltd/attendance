use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

use super::{entry::EntryDetails, leave::LeaveDetails, user::User};

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct UserDetails {
    pub user_info: Option<User>,
    pub checkin: Option<EntryDetails>,
    pub checkout: Option<EntryDetails>,
    pub leave: Option<LeaveDetails>,
}

pub trait UserDetailsList {
    fn to_json(self) -> String;
}
impl UserDetailsList for Vec<UserDetails> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
