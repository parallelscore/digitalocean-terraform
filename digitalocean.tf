terraform {
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
   count = var.number_servers
   name = "talentgraph-${count.index}"
   image = "ubuntu-20-04-x64"
   size = "s-1vcpu-1gb"
   region = var.region
   ssh_keys = [
        var.ssh_fingerprint
   ]
   tags   = ["${digitalocean_tag.lakefs.id}"]  
}

resource "digitalocean_tag" "lakefs" {
    name = "lakefs"
}

#create digital Ocean space

resource "digitalocean_spaces_bucket" "talentgraphspace1" {
  name   = "talentgraphspace1"
  region = "fra1"
}

#create Kubernetes deployment
resource "digitalocean_kubernetes_cluster" "talentgraph" {
  name   = "talentgraph"
  region = "lon1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 1

  }
}

