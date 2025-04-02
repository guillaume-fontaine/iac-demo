provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    ec2 = "http://ip10-0-3-5-cvmjg9434iqh49gh8510-4566.direct.lab-boris.fr"
  }
}

# Ressource pour créer une nouvelle AMI à partir d'une instance existante
resource "aws_ami_from_instance" "example" {
  name               = "terraform-example-${timestamp()}"
  source_instance_id = "i-0123456789abcdef0"  # Remplacez par l'ID de votre instance source
}

resource "aws_instance" "demo" {
  ami           = aws_ami_from_instance.example.id
  instance_type = "t2.micro"
}

