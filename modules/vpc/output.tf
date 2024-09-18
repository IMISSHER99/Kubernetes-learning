output "network_id" {
  value = google_compute_network.custom-vpc-network.id
}

output "network_name" {
  value = google_compute_network.custom-vpc-network.name
}

output "backend-subnet-name" {
  value = google_compute_subnetwork.back-end-subnet.name
  
}