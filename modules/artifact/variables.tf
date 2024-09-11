variable "project_id" {}
variable "project_region" {}
variable "repository_id" {
  default = "ecommerce-repository"
  description = "Artifact Repository Name"
}

variable "docker" {
  default = "DOCKER"
  description = "Repository Type"  
}

variable "artifact_registry_description" {
  default = "Artifact Registry repository for Docker images"
  description = "description"
}
