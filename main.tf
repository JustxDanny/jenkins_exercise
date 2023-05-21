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
resource "aws_s3_bucket" "mys3"{
    bucket = "terraform-bucket-daniel"
}
resource "aws_s3_bucket_public_access_block" "bucket_public_access_block_example" {
  bucket = "terraform-bucket-daniel"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
