variable "project_id" {}
variable "project_region" {}
variable "route_mode" {}
variable "ip_address_range_frontend" {}
variable "stack_type" {}
variable "aggregate_interval" {}
variable "include_all_metadata" {}
variable "ip_address_range_backend" {}
variable "ip_address_range_database" {}
variable "allow-internal-traffic" {}

variable "ingress" {
    default = "INGRESS"
    description = "Firewall Direction"
}
variable "allow_internal_traffic" {
  default = "allow-internal-traffic"
  description = "firewall name"
}
variable "protocol_icmp" {
  default = "icmp"
  description = "ICMP is essential for diagnostic tools like ping and traceroute, which help in troubleshooting network issues."
}
variable "protocol_tcp" {
  default = "tcp"
  description = "TCP is used for most application-level network communications within your VPC, such as web traffic (HTTP/HTTPS), database connections, APIs, and other backend services."
}

variable "firewall_ports" {
    default = ["80", "443", "5432", "22"]
    description = "Allowed Ports"
}
variable "protocol_udp" {
  default = "udp"
  description = "UDP is used for services that require faster, connectionless communication. Commonly used by DNS (port 53) and certain application protocols."
}

variable "udp_port" {
  default = ["53"]
  description = "Allowed Ports"
}

variable "allow_egress_internet" {
  default = "allow-egress-internet"
  description = "firewall name"
}

variable "egress" {
    default = "EGRESS"
    description = "Firewall Direction" 
}

variable "source_ranges" {}
variable "protocol_all" {
    default = "all"
    description = "Allow all protocols"
}

variable "destination_ranges" {}
variable "source_ranges_clousql" {}
variable "allow_cloudsql_ingress" {
  default = "allow-cloudsql-ingress"
  description = "Firewall name"
}

variable "clousql_port" {}
variable "deny_all_traffic" {
    default = "deny-all-traffic"
    description = "Firewall name"
  
}

variable "router_name" {
  default = "custom-router"
  description = "Router Name"
}

variable "nat_gateway" {
    default = "custom-nat-gateway"
    description = "Nat gateway name"
  
}

variable "auto_only" {
  default = "AUTO_ONLY"
  description = "nat_ip_allocate_option"
}

variable "list_of_subnetworks" {
  default = "LIST_OF_SUBNETWORKS"
  description = "List of subnetworks"
  
}

variable "all_ip_ranges" {
  default = ["ALL_IP_RANGES"]
  description = "All IP ranges"
}

variable "nat_log_filter" {
  default =  "ALL"
  description = "NATs log filter"
}

variable "private_ip_address" {
  default = "private-ip-address"
  description = "global ip address name"
}

variable "private_ip_type" {}
variable "private_ip_purpose" {}
variable "service" {}
variable "sql_instance" {
  default = "postgresql-database-instance"
  description = "Name of Cloud Sql Instance"
}

variable "database_version" {}
variable "machine_type" {}
variable "availability_type_regional" {}
variable "edition" {}
variable "environment" {}
variable "postgresql-database" {
  default = "postgresql-database"
  description = "Database Name"  
}
variable "db_username" {}
variable "db_password" {}
variable "backup-time" {}
variable "availability_type_zonal" {}
variable "update_track" {}
variable "storage_bucket" {
  default = "storage-bucker"
  description = "Storage Bucket Name"
}
variable "access_prevention_policy" {}
variable "change_storage_type" {
  default = "SetStorageClass"
  description = "Change Storage Class"
}
variable "nearline_storage_class" {
  default = "NEARLINE"
  description = "Storage Class Name"
}

variable "nearline_storage_age" {}
variable "coldline_storage_class" {
  default = "COLDLINE"
  description = "Storage Class Name"
}
variable "coldline_storage_age" {}
variable "archive_storage_class" {
  default = "ARCHIVE"
  description = "Storage Class Name"
}

variable "archive_storage_age" {}
variable "delete" {
  default = "Delete"
  description = "Action Type"
}
variable "delete_age" {}
variable "log_object_prefix" {
  default = "logs-"
  description = "Log Prefix"
}
variable "key_name" {}
