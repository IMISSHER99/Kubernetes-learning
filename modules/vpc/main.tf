# Creating a custom VPC
resource "google_compute_network" "custom-vpc-network" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = var.route_mode
  description = "Custom VPC for an ecommerce architecture"
  depends_on = [ 
    var.global_ip_address,
    var.service_network_peering_connection
   ]
}

# Creating a custom subnet
resource "google_compute_subnetwork" "front-end-subnet" {
  ip_cidr_range            = var.ip_address_range_frontend
  region                   = var.project_region
  name                     = var.subnet_name_frontend
  network                  = google_compute_network.custom-vpc-network.name
  description = "subnet for frontend"
  private_ip_google_access = true
  stack_type               = var.stack_type
  log_config {
    aggregation_interval = var.aggregate_interval
    flow_sampling        = 0.5
    metadata             = var.include_all_metadata
  }
}

resource "google_compute_subnetwork" "back-end-subnet" {
  ip_cidr_range            = var.ip_address_range_backend
  region                   = var.project_region
  name                     = var.subnet_name_backend
  network                  = google_compute_network.custom-vpc-network.name
  description = "subnet for backend"
  private_ip_google_access = true
  stack_type               = var.stack_type
  log_config {
    aggregation_interval = var.aggregate_interval
    flow_sampling        = 0.5
    metadata             = var.include_all_metadata
  }
}

resource "google_compute_subnetwork" "database-subnet" {
  ip_cidr_range            = var.ip_address_range_database
  region                   = var.project_region
  name                     = var.subnet_name_database
  network                  = google_compute_network.custom-vpc-network.name
  description = "subnet for database"
  private_ip_google_access = true
  stack_type               = var.stack_type
  log_config {
    aggregation_interval = var.aggregate_interval
    flow_sampling        = 0.5
    metadata             = var.include_all_metadata
  }
}