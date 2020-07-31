resource "aws_subnet" "jenkins-public-subnet" {
  vpc_id            = aws_vpc.jenkins-vpc.id
  cidr_block        = var.jenkins-subnet-cidr-block
  availability_zone = local.azs_names[0]

  tags = {
    Name        = "JenkinsPublicSubnet-${local.azs_names[0]}"
    Environment = terraform.workspace
  }
}
