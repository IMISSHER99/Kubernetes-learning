variable "project_id" {}
variable "project_region" {}
variable "delete_age" {}
variable "access_prevention_policy" {}
variable "nearline_storage_age" {}
variable "coldline_storage_age" {}
variable "archive_storage_age" {}
variable "key_name" {}
variable "environment" {}

variable "storage_bucket" {
  default = "storage-bucker"
  description = "Storage Bucket Name"
}
variable "change_storage_type" {
  default = "SetStorageClass"
  description = "Change Storage Class"
}
variable "nearline_storage_class" {
  default = "NEARLINE"
  description = "Storage Class Name"
}

variable "coldline_storage_class" {
  default = "COLDLINE"
  description = "Storage Class Name"
}
variable "archive_storage_class" {
  default = "ARCHIVE"
  description = "Storage Class Name"
}

variable "delete" {
  default = "Delete"
  description = "Action Type"
}
variable "log_object_prefix" {
  default = "logs-"
  description = "Log Prefix"
}