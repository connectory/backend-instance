resource "aws_instance" "this" {
  ami                  = data.aws_ami.ubuntu.image_id
  instance_type        = var.instance_type
  subnet_id            = module.vpc.private_subnets[0]
  iam_instance_profile = "${aws_iam_instance_profile.this.name}"

  tags = {
    Name = var.name
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_search_string]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_iam_role" "this" {
  name = var.name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "this" {
  name = "this"
  role = "${aws_iam_role.this.name}"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${aws_iam_role.this.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}