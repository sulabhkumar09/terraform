provider "aws" {
 region     = "ap-south-1"
}


resource "aws_instance" "web" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
  key_name      = "Terraform_Aug.pem"
  user_data     = "${file("httpd.sh")}"
  vpc_security_group_ids = ["${aws_security_group.webSG.id}"]
  tags = {
    Name = "Test-file-provisioner"
  }
}


resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}
