
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