# Backend Instance

Launches a backend instance with Session manager (SSM) access.

What the module acutally launches
- VPC
- Subnets
- NAT gateway 
- An ECU in a private subnet with instance profile for session manager access

## Example usage

```
provider "aws" {
  version = "~> 2.0"
  region = "eu-central-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

module "example" {
  source = "../"
  name = "foo"

  #overwrite default values 
  instance_type = "t2.micro"
  ami_search_string = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
  cidr_block = "10.255.0.0/16"
}
```