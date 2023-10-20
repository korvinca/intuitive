# Create a VPC and a subnet
module "vpc" {
  source     = "terraform-aws-modules/vpc/aws"
  version    = "5.1.2"
  name       = "intuitive-vpc"
}

resource "aws_subnet" "intuitive-subnet" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true
}

# Create an S3 bucket
resource "aws_s3_bucket" "intuitive_bucket" {
  bucket = "intuitive-bucket"
}

# Create an EC2 instance
resource "aws_instance" "intuitive_instance" {
  count         = 2
  ami           = "ami-03eb6185d756497f8"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.intuitive-subnet.id

  tags = {
    Name = "Intuitive-${count.index}"
  }
}

# Create EBS volumes and attach them to the EC2 instances
resource "aws_ebs_volume" "intuitive_volume" {
  count = 2
  availability_zone = "${var.aws_region}a"
  size              = 8
  type              = "gp2"
}

resource "aws_volume_attachment" "intuitive_attachment" {
  count = 2
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.intuitive_volume[count.index].id
  instance_id = aws_instance.intuitive_instance[count.index].id
}
