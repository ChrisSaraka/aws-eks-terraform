terraform {
  backend "s3" {
    bucket         = "csarakasidis-terraform-remote-state-storage-s3"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "csarakasidis-terraform-remote-state-storage-dynamodb"
  }
}
