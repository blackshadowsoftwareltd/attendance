pub mod db;
pub mod extensions;
pub mod functions;
pub mod models;
pub mod routes;
pub mod run;
pub mod test;
pub mod utils;
use run::run;

#[tokio::main]
async fn main() {
    run().await;
}
