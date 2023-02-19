terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
  }
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "random_uuid" "uuid" {
}


resource "aws_s3_bucket" "bucket_handler" {
    bucket = "${var.bucket_name}-${random_uuid.uuid.result}"

    tags = {
        Name = "${var.tag_name}"
        Environment = "${var.tag_environment}"
    }
}

resource "aws_s3_bucket_acl" "bucket_acl_handler" {
    bucket = aws_s3_bucket.bucket_handler.id
    acl = "private"
}

variable "bucket_name" {
    description = "Bucket Name has to be unique"
    type = string
    default = "simple-bucket"
}

variable "tag_name" {
    description = "Tag Name for the bucket"
    type = string
    default = "Bucket Tag created by terraform"
}

variable "tag_environment" {
    description = "Tag Environment for the bucket"
    type = string
    default = "Bucket Environment Tag created by terraform"
}

variable "aws_region" {
    description = "Preferred region of aws"
    type = string
    default = "us-east-1"
}