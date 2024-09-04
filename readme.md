# Infrastructure Setup and Deployment

This project automates the creation of infrastructure and deployment processes using Terraform, GitHub Actions, and Google Cloud services. The setup includes a custom VPC, a Google Kubernetes Engine (GKE) cluster, application deployment, image storage in Google Cloud Artifact Registry, and logging and monitoring using Google Cloud.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and configured
- [GitHub account](https://github.com) with repository access
- Access to a Google Cloud Project

## Setup Instructions

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

2. **Configure Terraform**

    Edit the `terraform/main.tf` file with your VPC, GKE cluster, and Artifact Registry settings.

3. **Initialize Terraform**

    ```bash
    terraform init
    ```

4. **Apply Terraform Configuration**

    ```bash
    terraform apply
    ```

    Confirm the action by typing `yes`.

5. **Build and Push Docker Images**

    ```bash
    docker build -t gcr.io/your-project-id/your-image-name:tag .
    docker push gcr.io/your-project-id/your-image-name:tag
    ```

6. **Deploy Applications to GKE**

    ```bash
    kubectl apply -f k8s/
    ```

7. **Set Up CI/CD with GitHub Actions**

    Configure workflows in the `.github/workflows/` directory for building Docker images, pushing to Artifact Registry, and deploying to GKE.

8. **Logging and Monitoring**

    Enable Google Cloud Logging and Monitoring for your GKE cluster via the Google Cloud Console.

## Troubleshooting

- **Terraform Errors**: Check Terraform logs and configuration.
- **Deployment Issues**: Review GKE and Kubernetes logs.
- **CI/CD Failures**: Inspect GitHub Actions logs.

## License

Licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Open issues or submit pull requests for suggestions or improvements.
