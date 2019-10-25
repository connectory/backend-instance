module "simple" {
  source            = "../"
  name              = "foobar"
  instance_type     = "t2.micro"
  ami_search_string = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
  cidr_block        = "10.255.0.0/16"
}