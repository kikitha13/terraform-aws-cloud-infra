terraform {
  backend "s3" {
    bucket         = "tf-state-AWS-CLOUD"
    key            = "project/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
