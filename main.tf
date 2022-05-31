terraform {
  backend "s3" {
    bucket = "sonalysistfstate"
    key    = "dev/digitaloceantf.tfstate"
    region = "us-east-2"
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "talentgraphlakefs" {
   count = 1
   name = "talentgraph-${count.index}"
   image = "ubuntu-20-04-x64"
   size = "s-1vcpu-1gb"
   region = "LON1"
}
