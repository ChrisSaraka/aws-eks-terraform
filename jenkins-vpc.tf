resource "aws_vpc" "jenkins-vpc" {
  cidr_block       = var.jenkins-cidr-block
  instance_tenancy = "default"

  tags = {
    Name        = "${terraform.workspace}-vpc"
    Environment = terraform.workspace
  }
}
