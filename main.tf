provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "example" {
    ami = "ami-0e067cc8a2b58de59"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-instance"
    }
}

resource "aws_s3_bucket" "mys3" {
    bucket = "terraform-bucket-daniel-public"
}

resource "aws_s3_bucket_public_access_block" "mys3" {
    bucket = aws_s3_bucket.mys3.id
    block_public_acls = false
    block_public_policy = false
}