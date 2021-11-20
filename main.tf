terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

data "template_file" "user_data" {
  template = file("bootstrap.yml")
}

resource "aws_instance" "training_server" {
  ami             = "ami-0e5989519d28fb3cc"
  instance_type   = "p3.2xlarge"
  key_name        = "training-server-key"
  security_groups = ["${aws_security_group.allow_ssh.name}", "${aws_security_group.allow_out.name}"]
  user_data       = data.template_file.user_data.rendered

  tags = {
    Name    = "DnnTrainingInstance"
    Purpose = "DnnTrainingJob"
  }
}
