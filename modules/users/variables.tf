variable "project_id" {}
variable "project_region" {}
variable "cloud_sql_admin" {
  default = "roles/cloudsql.admin"
  description = "Cloud Sql Admin Role"
}
variable "cloud_storage_admin" {
  default = "roles/storage.admin"
  description = "Cloud Storage Admin Role"  
}
variable "cloud_storage_object_admin" {
  default = "roles/storage.objectAdmin"
  description = "Storgae Object Admin Role"
}
variable "secrets_manager_admin" {
    default = "roles/secretmanager.admin"
    description = "Secret Manager Admin" 
}
variable "service_account_token_creator" {
  default = "roles/iam.serviceAccountTokenCreator"
  description = "Service Account Token Creator"
}
variable "compute_security_admin" {
  default = "roles/compute.securityAdmin"
  description = "Compute Security Admin"
}
variable "compute_network_admin" {
  default = "roles/compute.networkAdmin"
  description = "Compute Network Admin"
}
variable "cloud-kms-encrypter-decrypter" {
  default = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  description = "Cloud KMS encrypter/Decrypter"
}
variable "artifact-registry-admin" {
    default = "roles/artifactregistry.admin"
    description = "Artifact Registry Admin"
}
variable "admin_user_email" {
  default = "user:radiantimissher@gmail.com"
  description = "Admin User Email"
}