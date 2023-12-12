use crate::{
    db::{
        config::db_config, create_table::create_user_table, read::read_users_db, write::add_user_db,
    },
    models::user::User,
    routes::router::routes,
    utils::addr::ip_address,
};

pub async fn run() {
    println!("Start");
    match db_config().await {
        Ok(_) => {
            create_user_table().await.unwrap();
            println!("Database connected");
            let user = User {
                user_id: 0,
                name: "test".to_string(),
                email: "example@.io.co".to_string(),
                password: "password".to_string(),
            };
            add_user_db(user).await.unwrap();
            let users = read_users_db().await.unwrap();
            println!("Users: {:?}", users);

            // initialize tracing
            tracing_subscriber::fmt::init();

            // build our application with a route
            let app = routes().await;

            let addr = ip_address().await;

            let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
            println!("Listening on {}", addr);
            axum::serve(listener, app).await.unwrap();
        }
        Err(e) => println!("Error: {}", e),
    }
}
