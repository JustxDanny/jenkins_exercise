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
resource "aws_s3_bucket" "bucket_public" {
  bucket = "terraform-bucket-daniel"
  
  # Other bucket configuration options...

  # Enable public access
  acl = "public-read"

  # Add a bucket policy to allow public access
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
EOF
}
