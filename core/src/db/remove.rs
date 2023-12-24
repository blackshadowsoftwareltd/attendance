use anyhow::Result;

use crate::utils::{constants::sql_command::*, lock::DB};

pub async fn remove_users_db(users: Vec<i64>) -> Result<()> {
    let pool = DB.get().unwrap();
    let ids = users
        .iter()
        .map(|x| x.to_string())
        .collect::<Vec<String>>()
        .join(", ");
    let q = format!("{DELETE} from {USERS} {WHERE} {USER_ID} IN ({ids})",);
    println!("{}", q);
    sqlx::query(q.as_str()).execute(pool).await?;

    Ok(())
}

pub async fn remove_check_in_db(users: Vec<i64>) -> Result<()> {
    let pool = DB.get().unwrap();
    let ids = users
        .iter()
        .map(|x| x.to_string())
        .collect::<Vec<String>>()
        .join(", ");
    let q = format!("{DELETE} from {CHECKIN} {WHERE} {USER_ID} IN ({ids})",);
    println!("{}", q);
    sqlx::query(q.as_str()).execute(pool).await?;

    Ok(())
}
