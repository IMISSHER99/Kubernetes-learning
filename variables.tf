variable "project_id" {}
variable "project_region" {}
variable "vpc_name" {}
variable "route_mode" {}
variable "subnet_name_frontend" {}
variable "ip_address_range_frontend" {}
variable "stack_type" {}
variable "aggregate_interval" {}
variable "include_all_metadata" {}
variable "allow-internal-traffic" {}
variable "ingress" {
    default = "INGRESS"
    description = "Firewall Direction"
}
variable "ip_address_range_backend" {}
variable "subnet_name_backend" {}
variable "ip_address_range_database" {}
variable "subnet_name_database" {}
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

variable "source_ranges" {}
variable "protocol_all" {
    default = "all"
    description = "Allow all protocols"
}

variable "destination_ranges" {}
variable "source_ranges_clousql" {}
variable "allow_cloudsql_ingress" {
  default = "allow-cloudsql-ingress"
  description = "Firewall name"
}

variable "clousql_port" {}
variable "deny_all_traffic" {
    default = "deny-all-traffic"
    description = "Firewall name"
  
}
