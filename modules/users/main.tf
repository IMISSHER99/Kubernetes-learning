resource "google_project_iam_member" "cloud-sql-admin" {
    project = var.project_id
    role = var.cloud_sql_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "cloud-storage-admin" {
    project = var.project_id
    role = var.cloud_storage_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "cloud-storage-object-admin" {
    project = var.project_id
    role = var.cloud_storage_object_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "secrets-manager-admin" {
    project = var.project_id
    role = var.secrets_manager_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "service-account-token-creator" {
    project = var.project_id
    role = var.service_account_token_creator
    member = var.admin_user_email
}

resource "google_project_iam_member" "compute-network-admin" {
    project = var.project_id
    role = var.compute_network_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "compute-security-admin" {
    project = var.project_id
    role = var.compute_security_admin
    member = var.admin_user_email
}

resource "google_project_iam_member" "cloud-kms-encrypter-decrypter" {
    project = var.project_id
    role = var.cloud-kms-encrypter-decrypter
    member = var.admin_user_email
}

resource "google_project_iam_member" "artifact-registry-admin" {
    project = var.project_id
    role = var.artifact-registry-admin
    member = var.admin_user_email
}