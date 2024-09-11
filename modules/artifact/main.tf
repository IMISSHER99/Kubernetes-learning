resource "google_artifact_registry_repository" "artifact-registry" {
    location = var.project_region
    repository_id = var.repository_id
    format = var.docker
    description = var.artifact_registry_description
}