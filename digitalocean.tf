terraform {

# terraform {
#       backend "remote" {
#         # The name of your Terraform Cloud organization.
#         organization = "example-organization"
#
#         # The name of the Terraform Cloud workspace to store Terraform state files in.
#         workspaces {
#           name = "example-workspace"
#         }
#       }
#     }
#
#     # An example resource that does nothing.
#     resource "null_resource" "example" {
#       triggers = {
#         value = "A example resource that does nothing!"
#       }
#     }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}
provider "digitalocean" {
  token = var.api_token

#DO space details
  spaces_access_id  = var.access_id
  spaces_secret_key = var.secret_key
}

resource "digitalocean_droplet" "talentgraphlakefs" {
   count = 1
   name = "talentgraph-${count.index}"
   image = "ubuntu-20-04-x64"
   size = "s-1vcpu-1gb"
   region = var.region
   ssh_keys = [
        var.ssh_fingerprint
   ]
}

