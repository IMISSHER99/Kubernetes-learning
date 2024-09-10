resource "google_compute_global_address" "private-ip-address" {
    name = var.private_ip_address
    address_type = var.private_ip_type
    purpose = var.private_ip_purpose
    network = google_compute_network.custom-vpc-network.id  
    prefix_length = 16
    depends_on = [ google_compute_network.custom-vpc-network ]
}

resource "google_service_networking_connection" "private-vpc-connection" {
    network = google_compute_network.custom-vpc-network.id
    service = var.service
    reserved_peering_ranges = [google_compute_global_address.private-ip-address.name]
}

resource "google_sql_database_instance" "sql-instance" {
  name = var.sql_instance
  region = var.project_region
  database_version = var.database_version

  depends_on = [ google_service_networking_connection.private-vpc-connection ]

  settings {
    tier              = var.machine_type
    availability_type = var.availability_type
    edition           = var.edition
    user_labels       = {
      environment = var.environment
    }
    ip_configuration {
      ipv4_enabled      = true
      private_network   = google_compute_network.custom-vpc-network.id
      enable_private_path_for_google_cloud_services = true
    }
  }
  deletion_protection = false
}

resource "google_sql_database" "postgresql-database" {
    name = var.postgresql-database
    instance = google_sql_database_instance.sql-instance.name 
}

resource "google_sql_user" "postgresql-user" {
    name = data.google_secret_manager_secret_version_access.db-username-access.secret_data
    instance = google_sql_database_instance.sql-instance.name
    password = data.google_secret_manager_secret_version_access.db-password-access.secret_data
}   
