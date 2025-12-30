terraform {
  backend "s3" {
    bucket         = "devops-capstone-tfstate-tuirytuirytruiyt"
    key            = "support-platform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

