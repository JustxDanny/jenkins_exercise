provider "aws" {
    region = "eu-central-1"
}
resource "aws_instance" "jenkins_example" {
     ami = "ami-0d497a49e7d359666"
     instance_type = "t2.micro"
     tags = {
        Name = "terraform-instance"
    }
}