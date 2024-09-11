variable "database_version" {}
variable "machine_type" {}
variable "availability_type_regional" {}
variable "edition" {}
variable "environment" {}
variable "db_username" {}
variable "db_password" {}
variable "backup-time" {}
variable "availability_type_zonal" {}
variable "update_track" {}
variable "private_ip_type" {}
variable "private_ip_purpose" {}
variable "service" {}
variable "project_region" {}
variable "network_id" {}
variable "db_username_output" {}
variable "db_password_output" {}

variable "private_ip_address" {
  default = "private-ip-address"
  description = "global ip address name"
}

variable "postgresql-database" {
  default = "postgresql-database"
  description = "Database Name"  
}

variable "sql_instance" {
  default = "postgresql-database-instance"
  description = "Name of Cloud Sql Instance"
}
