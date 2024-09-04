project_id = "kubernetes-learning-433210"
project_region = "asia-south1"
vpc_name = "kubernetes-network"
route_mode = "REGIONAL"
subnet_name = "kubetnetes-subnet"
ip_address_range = "192.168.0.0/28"
stack_type = "IPV4_ONLY"
aggregate_interval = "INTERVAL_5_SEC"
include_all_metadata = "INCLUDE_ALL_METADATA"
kubernetes_network_description = "Network created for learning GKE"
kubernetes_subnetwork_description = "Subnetwork created for learning GKE"
firewall_rule_gke = "firewall-rule-gke"
firewall_protocol = "tcp"
firewall_ports = ["80", "8080"]
firewall_tags = ["gke-firewall-rule"]
firewall_ip_range = ["27.60.164.15/32"]
direction = "INGRESS"