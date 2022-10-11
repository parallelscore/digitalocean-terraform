terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
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

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  count = var.droplet_count
  name   = "web-${var.region}-${count.index +1}"
  region = var.region
  size   = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]

  /* lifecycle {
      create_before_destroy = true
  } */
}

