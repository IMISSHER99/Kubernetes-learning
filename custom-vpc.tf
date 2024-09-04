# Creating a custom VPC
resource "google_compute_network" "custom-vpc-network" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = var.route_mode
  description = var.kubernetes_network_description
}

# Creating a custom subnet
resource "google_compute_subnetwork" "custom-subnet" {
  ip_cidr_range            = var.ip_address_range
  region                   = var.project_region
  name                     = var.subnet_name
  network                  = google_compute_network.custom-vpc-network.name
  description = var.kubernetes_subnetwork_description
  private_ip_google_access = true
  stack_type               = var.stack_type
  log_config {
    aggregation_interval = var.aggregate_interval
    flow_sampling        = 0.5
    metadata             = var.include_all_metadata
  }
}
