resource "digitalocean_firewall" "do_firewall" {
  name  = "testing-terraform-firewall"
  tags  = ["terraform-testing"]
}
