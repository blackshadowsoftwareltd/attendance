use crate::{routes::router::routes, utils::addr::ip_address};

pub async fn run() {
    println!("Start");

    // initialize tracing
    tracing_subscriber::fmt::init();

    // build our application with a route
    let app = routes().await;

    let addr = ip_address().await;

    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    println!("Listening on {}", addr);
    axum::serve(listener, app).await.unwrap();
}
