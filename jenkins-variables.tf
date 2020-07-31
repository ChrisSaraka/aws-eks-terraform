variable "jenkins-cidr-block" {
  type = string
}

variable "jenkins-subnet-cidr-block" {
  type = string
}

variable "jenkins-server-region" {
  type = string
}

variable "ami_ids" {
  default = {
    eu-west-2 = "ami-032598fcc7e9d1c7a"
  }
}
