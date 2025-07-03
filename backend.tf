terraform {
  backend "s3" {
    bucket         = "tf-state-kikitha"
    key            = "project/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
