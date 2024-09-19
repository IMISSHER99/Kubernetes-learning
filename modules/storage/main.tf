resource "google_storage_bucket" "storage-bucket" {
    name = var.storage_bucket
    location = var.project_region
    project = var.project_id

    versioning {
      enabled = true
    }

    uniform_bucket_level_access = true
    public_access_prevention = var.access_prevention_policy

    lifecycle_rule {
      action {
        type = var.change_storage_type
        storage_class = var.nearline_storage_class
      }
      condition {
        age = var.nearline_storage_age

      }

    }

    lifecycle_rule {
      action {
        type = var.change_storage_type
        storage_class = var.coldline_storage_class
      }
      condition {
        age = var.coldline_storage_age
        
      }

    }

    lifecycle_rule {
      action {
        type = var.change_storage_type
        storage_class = var.archive_storage_class
      }
      condition {
        age = var.archive_storage_age
        
      }

    }

    lifecycle_rule {
      action {
        type = var.delete
      }
      condition {
        age = var.delete_age
        
      }

    }
    
    logging {
      log_bucket = var.storage_bucket
      log_object_prefix = var.log_object_prefix
    }

    labels = {
      environment = var.environment
    }  

    # encryption {
    #   default_kms_key_name = var.key_name
    # }
}
