data "google_secret_manager_secret" "db-username" {
    secret_id = var.db_username
}

data "google_secret_manager_secret" "db-password" {
    secret_id = var.db_password
}

data "google_secret_manager_secret_version_access" "db-username-access" {
    secret = data.google_secret_manager_secret.db-username.secret_id
  
}

data "google_secret_manager_secret_version_access" "db-password-access" {
    secret = data.google_secret_manager_secret.db-password.secret_id
}