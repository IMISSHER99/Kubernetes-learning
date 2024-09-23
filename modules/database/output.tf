output "global_ip_address" {
    value = google_compute_global_address.private-ip-address
}

output "service_network_peering_connection" {
    value = google_service_networking_connection.private-vpc-connection
  
}