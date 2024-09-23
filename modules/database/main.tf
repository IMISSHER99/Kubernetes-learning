resource "google_compute_global_address" "private-ip-address" {
    name = var.private_ip_address
    address_type = var.private_ip_type
    purpose = var.private_ip_purpose
    network = var.network_id  
    prefix_length = 16
    depends_on = [ var.network_id ]
}

resource "google_service_networking_connection" "private-vpc-connection" {
    network = var.network_id
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
    availability_type = var.availability_type_regional
    edition           = var.edition
    user_labels       = {
      environment = var.environment
    }
    ip_configuration {
      ipv4_enabled      = true
      private_network   = var.network_id
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration {
      enabled = true
      start_time = var.backup-time
      point_in_time_recovery_enabled = true
    }

    maintenance_window {
      day = 7
      hour = 20
      update_track = var.update_track
    }
  }
  deletion_protection = false
}

resource "google_sql_database_instance" "sql-instance-read-replica" {
  name = "${var.sql_instance}-replica"
  master_instance_name = google_sql_database_instance.sql-instance.name
  region = var.project_region
  database_version = var.database_version

  settings {
    tier              = var.machine_type
    availability_type = var.availability_type_zonal
    edition           = var.edition
    user_labels       = {
      environment = var.environment
    }
    ip_configuration {
      ipv4_enabled      = true
      private_network   = var.network_id
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
    name = var.db_username_output
    instance = google_sql_database_instance.sql-instance.name
    password = var.db_password_output
}   
