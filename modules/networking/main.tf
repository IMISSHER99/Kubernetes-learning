
# Creating a firewall rule
resource "google_compute_firewall" "allow-internal-traffic" {
  name = var.allow_internal_traffic
  network = var.network_id

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
  network = var.network_id

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
  network = var.network_id

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
  network = var.network_id

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



resource "google_compute_router" "router" {
  name = var.router_name
  network = var.network_name
  region = var.project_region

  bgp {
    asn = 64514
  }
  
}

resource "google_compute_router_nat" "nat_gateway" {
  name = var.nat_gateway
  router = google_compute_router.router.name
  region = google_compute_router.router.region
  nat_ip_allocate_option = var.auto_only
  
  source_subnetwork_ip_ranges_to_nat = var.list_of_subnetworks
  subnetwork {
    name = var.backend_subnet_name
    source_ip_ranges_to_nat = var.all_ip_ranges
  }

  log_config {
    enable = true
    filter = var.nat_log_filter
  }
  
}