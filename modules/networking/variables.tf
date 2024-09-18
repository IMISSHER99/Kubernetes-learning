variable "allow-internal-traffic" {}
variable "source_ranges" {}
variable "include_all_metadata" {}
variable "network_id" {}
variable "project_region" {}
variable "network_name" {}
variable "backend_subnet_name" {}
variable "clousql_port" {}
variable "destination_ranges" {}
variable "source_ranges_clousql" {}


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

variable "protocol_all" {
    default = "all"
    description = "Allow all protocols"
}

variable "allow_cloudsql_ingress" {
  default = "allow-cloudsql-ingress"
  description = "Firewall name"
}

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