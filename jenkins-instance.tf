resource "aws_instance" "jenkins-instance" {
  ami                    = var.ami_ids[var.jenkins-server-region]
  subnet_id              = aws_subnet.jenkins-public-subnet.id
  instance_type          = "t3.medium"
  iam_instance_profile   = aws_iam_instance_profile.jenkins-instance-profile.id
  vpc_security_group_ids = ["${aws_security_group.jenkins-sg.id}"]
  key_name               = "my-key-pair-london"
  user_data              = file("./jenkins-scripts/jenkins-script.sh")

  tags = {
    Name        = "JenkinsServer"
    Environment = terraform.workspace
  }
}
