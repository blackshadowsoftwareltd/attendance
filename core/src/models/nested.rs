use serde::{Deserialize, Serialize};
use sqlx::{FromRow, Row};

#[derive(Serialize, Deserialize, Debug, Clone, PartialEq, Eq, Hash, sqlx::Type)]
pub struct Dashboard {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub setting: Option<Settings>,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub asdf: Option<Settings>,
}

#[derive(Serialize, Deserialize, Debug, Clone, PartialEq, Eq, Hash, FromRow, sqlx::Type)]
pub struct Settings {
    #[serde(skip_serializing_if = "Option::is_none")]
    #[sqlx(default)] // for optional fields to read db
    pub theme: Option<String>,
}

impl<'r> FromRow<'r, sqlx::sqlite::SqliteRow> for Dashboard {
    fn from_row(row: &'r sqlx::sqlite::SqliteRow) -> std::result::Result<Self, sqlx::Error> {
        Ok(Self {
            setting: serde_json::from_value(row.try_get("setting")?).ok(),
            asdf: serde_json::from_value(row.try_get("asdf")?).ok(),
        })
    }
}
