# GKE VPC Network Creation

## Introduction
This document outlines the steps used to create a custom mode vpc network in Google Cloud Platform using 'gcloud' command line tool.

## Commands Used
### VPC Network
```bash
gcloud compute networks create kubernetes-network --project=kubernetes-learning-433210 --description=VPC\ created\ for\ GKE --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional
```
#### Arguments
* project - This refers to the project in which a VPC should be created
* description - (optional) description of the VPC
* subnet-mode - There are two options available
  * custom - allows IPv4 and IPV6
  * automatic - only allows IPV4
* mtu - maximum transmission unit. The MTU is the size, in bytes, of the largest packet supported by a network layer protocol, including both headers and data. Updating this field after the VPC network is created can result in packet loss and is not supported in the console.
* bgp-routing-mode - There are two options available
  * regional - Cloud Routers will learn routes only in the region in which they were created
  * global - Global routing lets you dynamically learn routes to and from all regions with a single VPN or interconnect and Cloud Router

### Subnet

```bash
gcloud compute networks subnets create kubernetes-subnet --project=kubernetes-learning-433210 --description=Subnet\ created\ for\ Kubernetes --range=10.0.1.0/24 --stack-type=IPV4_ONLY --network=kubernetes-network --region=asia-south1 --enable-private-ip-google-access --enable-flow-logs --logging-aggregation-interval=interval-5-sec --logging-flow-sampling=0.5 --logging-metadata=include-all
```

#### Arguments
* project - This refers to the project in which a VPC should be created
* description - (optional) description of the VPC
* range - specifies the IP range
* stack-type - There are two options available
  * IPV4 - IPV4 address
  * IPV4-IPV6 - IPV4 and IPV6 address
* network - Specifies the network to which the subnet belongs to
* region - Specifies the region
* enable-private-ip-google-access - Set whether VMs in this subnet can access Google services without assigning external IP addresses
* enable-flow-logs - Turning on VPC flow logs doesn't affect performance, but some systems generate a large number of logs, which can increase costs in Logging.
* logging-aggregation - nformation for sampled packets is aggregated over this interval to generate a flow log record. For more information


