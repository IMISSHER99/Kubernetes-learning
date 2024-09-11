output "db-username-output" {
    value = data.google_secret_manager_secret_version_access.db-username-access.secret_data 
}

output "db-password-output" {
    value = data.google_secret_manager_secret_version_access.db-password-access.secret_data
  
}