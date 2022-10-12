resource "digitalocean_droplet" "do_droplet" {
    name   = "testing-terraform"
    region = "fra1"
    tags   = ["terraform-testing"]
    count  = "1"
}
