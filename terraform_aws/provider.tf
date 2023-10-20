provider "aws" {
  region = var.aws_region
  access_key = "YOUR_AWS_ACCESS_KEY" # Comment this line for using GHA
  secret_key = "YOUR_AWS_SECRET_KEY" # Comment this line for using GHA
}