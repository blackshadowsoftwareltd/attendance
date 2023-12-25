use serde::{Deserialize, Serialize};
use sqlx::prelude::FromRow;

#[derive(Debug, Serialize, Clone, PartialEq, Deserialize, FromRow)]
pub struct CheckOut {
    pub check_out_id: Option<i64>,
    pub check_in_id: Option<i64>,
    pub check_out_time: Option<String>,
}

impl CheckOut {
    pub fn with_id(self, check_out_id: Option<i64>) -> Self {
        Self {
            check_out_id,
            ..self
        }
    }
    pub fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

pub trait CheckOutList {
    fn to_json(self) -> String;
}
impl CheckOutList for Vec<CheckOut> {
    fn to_json(self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
