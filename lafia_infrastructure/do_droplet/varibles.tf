variable "do_token" {}

variable "region" {
    type = string
    default = "sfo3"
}

variable "droplet_count" {
    type = string
    default = "4"
}

variable "droplet_size" {
    type = string
    default = "s-1vcpu-1gb"
}

/* variable "droplet_name" {
    type = string
    default = "web"
} */