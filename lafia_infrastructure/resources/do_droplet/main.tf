terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "sfo3.digitaloceanspaces.com"
    region                      = "us-east-1" // needed
    bucket                      = "terraform.stf" // name of your space
    key                         = "infrastructure/terraform.tfstate"
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
/* variable "do_token" {} */

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


data "digitalocean_ssh_key" "ssh_key" {
  name = "Bayo M1 Pro"
}

/* data "digitalocean_vpc" "do_vpc" {
  name = "default-nyc1"
} */

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  count = var.droplet_count
  name   = "web-${var.region}-${count.index +1}"
  region = var.region
  size   = var.droplet_size
  /* vpc_uuid = data.digitalocean_vpc.do_vpc.id */
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]

  /* lifecycle {
      create_before_destroy = true
  } */
}

