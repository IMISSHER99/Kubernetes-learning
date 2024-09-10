
resource "google_compute_router" "router" {
  name = var.router_name
  network = google_compute_network.custom-vpc-network.name
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
    name = google_compute_subnetwork.back-end-subnet.name
    source_ip_ranges_to_nat = var.all_ip_ranges
  }

  log_config {
    enable = true
    filter = var.nat_log_filter
  }
  
}