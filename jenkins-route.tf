resource "aws_internet_gateway" "jenkins-ig" {
  vpc_id = aws_vpc.jenkins-vpc.id

  tags = {
    Name = "Jenkins-IGW"
  }
}

resource "aws_route_table" "jenkins-rt" {
  vpc_id = aws_vpc.jenkins-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-ig.id
  }
}

resource "aws_route_table_association" "jenkins-pub-sub-association" {
  route_table_id = aws_route_table.jenkins-rt.id
  subnet_id      = aws_subnet.jenkins-public-subnet.id
}
