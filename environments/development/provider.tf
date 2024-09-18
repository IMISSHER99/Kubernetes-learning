terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "5.37.0"
        }
    }
    backend "cloud-storage-backend" {
        bucket = "terraform-github-actions-bucket"
        prefix = "terraform/state"
    }
}

provider "google" {
  project = var.project_id
  region  = var.project_region
}