terraform {
    required_version = ">= 0.11, < 0.12"
    backend "s3" {
    skip_requesting_account_id = true
    skip_credentials_validation = true
    skip_get_ec2_platforms = true
    skip_metadata_api_check = true
    access_key = "var.access_id"
    secret_key = "var.secret_key"
    endpoint = "https://fra1.digitaloceanspaces.com"
    region = "us-east-1"
    bucket = "sonalysisspace1" // name of your space
    key = "sonalysistfstate/terraform.tfstate"
  }
}  
provider "digitalocean" {
  token = var.api_token
}

resource "digitalocean_droplet" "talentgraphlakefs" {
   count = 1
   name = "talentgraph-${count.index}"
   image = "ubuntu-20-04-x64"
   size = "s-1vcpu-1gb"
   region = "LON1"
}
