resource "aws_iam_role" "jenkins-role" {
  name               = "jenkins-role"
  assume_role_policy = file("jenkins-scripts/jenkins-ec2-assume-role.yml")
}

resource "aws_iam_role_policy" "jenkins-policy" {
  name   = "jenkins-policy"
  role   = aws_iam_role.jenkins-role.id
  policy = file("jenkins-scripts/jenkins-ec2-policy.yml")
}

resource "aws_iam_instance_profile" "jenkins-instance-profile" {
  name = "jenkins-instance-profile"
  role = aws_iam_role.jenkins-role.id
}

resource "aws_eip" "jenkins-eip" {
  instance = aws_instance.jenkins-instance.id
  vpc      = true
}
