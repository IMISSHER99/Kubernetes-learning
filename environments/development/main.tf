module "vpc" {
    source                    = "../../modules/vpc"
    project_id                = var.project_id
    project_region            = var.project_region
    route_mode                = var.route_mode
    ip_address_range_frontend = var.ip_address_range_frontend
    ip_address_range_backend  = var.ip_address_range_backend
    ip_address_range_database = var.ip_address_range_database
    stack_type                = var.stack_type
    aggregate_interval        = var.aggregate_interval
    include_all_metadata      = var.include_all_metadata
}

module "networking" {
    source                      = "../../modules/networking"
    network_id                  = module.vpc.network_id
    network_name                = module.vpc.network_name
    backend_subnet_name         = module.vpc.backend-subnet-name
    allow-internal-traffic      = var.allow-internal-traffic
    source_ranges               = var.source_ranges
    destination_ranges          = var.destination_ranges
    source_ranges_clousql       = var.source_ranges_clousql
    clousql_port                = var.clousql_port
    include_all_metadata        = var.include_all_metadata
    project_region              = var.project_region  
}

module "secrets" {
    source = "../../modules/secrets"
    db_password = var.db_password
    db_username = var.db_username
}

module "database" {
    source = "../../modules/database"
    network_id = module.vpc.network_id
    db_username_output = module.secrets.db-username-output
    db_password_output = module.secrets.db-password-output
    machine_type = var.machine_type
    database_version = var.database_version
    availability_type_regional = var.availability_type_regional
    edition = var.edition
    environment = var.environment
    db_username = var.db_username
    db_password = var.db_password
    backup-time = var.backup-time
    availability_type_zonal = var.availability_type_zonal
    update_track = var.update_track
    private_ip_type = var.private_ip_type
    private_ip_purpose = var.private_ip_purpose
    service = var.service
    project_region = var.project_region
  
}

module "storage-bucket" {
  source                            = "../../modules/storage"
  project_id                        = var.project_id
  project_region                    = var.project_region
  nearline_storage_age              = var.nearline_storage_age
  coldline_storage_age              = var.coldline_storage_age
  archive_storage_age               = var.archive_storage_age
  delete_age                        = var.delete_age
  access_prevention_policy          = var.access_prevention_policy
  key_name                          = var.key_name
  environment                       = var.environment

}

module "artifact_registry" {
    source                      = "../../modules/artifact"
    project_id                  = var.project_id
    project_region              = var.project_region  
}