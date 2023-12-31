use anyhow::Result;

use crate::utils::{constants::sql_command::*, lock::DB};

pub async fn create_user_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {USERS} (
            {USER_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {NAME} {VARCHAR},
            {EMAIL} {VARCHAR} {UNIQUE},
            {PASSWORD} {VARCHAR} {NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table users")
    }
    Ok(())
}

pub async fn create_check_in_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {CHECKIN} (
            {CHECK_IN_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {USER_ID} {INTEGER} {NOT_NULL} {REFERENCES} {USERS}({USER_ID}),
            {CHECK_IN_TIME} {VARCHAR} {NOT_NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table Checkin")
    }
    Ok(())
}

pub async fn create_check_out_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {CHECKOUT} (
            {CHECK_OUT_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {CHECK_IN_ID} {INTEGER} {NOT_NULL} {REFERENCES} {CHECKIN}({CHECK_IN_ID}),
            {CHECK_OUT_TIME} {VARCHAR} {NOT_NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table Checkout")
    }
    Ok(())
}

pub async fn create_leave_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {LEAVE} (
            {LEAVE_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {USER_ID} {INTEGER} {NOT_NULL} {REFERENCES} {USERS}({USER_ID}),
            {LEAVE_TIME} {VARCHAR} {NOT_NULL},
            {LEAVE_REASON} {VARCHAR} {NOT_NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table leave")
    }
    Ok(())
}

pub async fn create_break_table() -> Result<()> {
    {
        let pool = DB.get().unwrap();
        let q = format!(
            "{CREATE_TABLE} {IF_NOT_EXISTS} {BREAKS} (
            {BREAK_ID} {INTEGER} {PRIMARY_KEY} {AUTO_INCREMENT},
            {USER_ID} {INTEGER} {NOT_NULL} {REFERENCES} {USERS}({USER_ID}),
            {BREAK_START_AT} {VARCHAR} {NOT_NULL},
            {BREAK_END_AT} {VARCHAR} {NOT_NULL},
            {BREAK_REASON} {VARCHAR} {NOT_NULL}
        )"
        );

        sqlx::query(q.as_str()).execute(pool).await?;
        println!("Created table break")
    }
    Ok(())
}
