# Creating a custom VPC
resource "google_compute_network" "custom-vpc-network" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = var.route_mode
  description = "Custom VPC for an ecommerce architecture"
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

# Creating a firewall rule
resource "google_compute_firewall" "allow-internal-traffic" {
  name = var.allow_internal_traffic
  network = google_compute_network.custom-vpc-network.name

  allow {
    protocol = var.protocol_icmp
  }

  allow {
    protocol = var.protocol_tcp
    ports = var.firewall_ports
  }

  allow {
    protocol = var.protocol_udp
    ports = var.udp_port
  }

  source_tags = ["front-end", "back-end", "database"]
  target_tags = ["front-end", "back-end", "database"]
  source_ranges = var.source_ranges
  direction = var.ingress
  priority = 1000
  log_config {
    metadata = var.include_all_metadata
  }
  
}

resource "google_compute_firewall" "allow-egress-internet" {
  name = var.allow_egress_internet
  network = google_compute_network.custom-vpc-network.name

  allow {
    protocol = var.protocol_all
  }

  destination_ranges = var.destination_ranges
  direction = var.egress
  priority = 1000
  log_config {
    metadata = var.include_all_metadata
  }
  
}

resource "google_compute_firewall" "allow-cloudsql-ingress" {
  name = var.allow_cloudsql_ingress
  network = google_compute_network.custom-vpc-network.name

  allow {
    protocol = var.protocol_tcp
    ports = var.clousql_port
  }

  source_tags = ["back-end"]
  target_tags = ["database"]

  source_ranges  = var.source_ranges_clousql
  direction = var.ingress
  priority = 1000
  log_config {
    metadata = var.include_all_metadata
  }
  
}

resource "google_compute_firewall" "deny-all-ingress" {
  name = var.deny_all_traffic
  network = google_compute_network.custom-vpc-network.name

  allow {
    protocol = var.protocol_all
  }

  source_ranges  = var.destination_ranges
  direction = var.ingress
  priority = 65535
  log_config {
    metadata = var.include_all_metadata
  }
  
}