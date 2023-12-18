pub trait VecExt {
    fn to_json(&self) -> String;
}

impl VecExt for Vec<i64> {
    fn to_json(&self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}
