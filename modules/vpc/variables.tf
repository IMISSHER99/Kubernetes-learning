variable "project_id" {}
variable "project_region" {}
variable "route_mode" {}
variable "ip_address_range_frontend" {}
variable "stack_type" {}
variable "aggregate_interval" {}
variable "include_all_metadata" {}
variable "ip_address_range_backend" {}
variable "ip_address_range_database" {}
variable "global_ip_address" {}
variable "service_network_peering_connection" {}

variable "vpc_name" {
    default = "custom-vpc"
    description = "VPC Name"
}

variable "subnet_name_frontend" {
    default = "subnet-frontend"
    description = "Subnet Name"
}

variable "subnet_name_backend" {
    default = "subnet-backend"
    description = "Subnet Name"
}

variable "subnet_name_database" {
    default = "subnet-database"
    description = "Subnet Name"
}

