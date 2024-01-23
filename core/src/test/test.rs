#[cfg(test)]
mod test {
    use anyhow::Result;

    #[test]
    fn test_fn() -> Result<()> {
        tokio::spawn(async move {
            match crate::db::config::db_config().await {
                Ok(_) => {}
                Err(e) => println!("Error: {}", e),
            }
        });

        Ok(())
    }
}
