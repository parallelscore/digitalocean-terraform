variable "do_token" {}

variable "region" {
  default = "lon1"
}

variable "k8s_clustername" {
  default = "lafiadev"
}

variable "k8s_version" {
  default = "latest"
}

variable "k8s_poolname" {
  default = "worker-pool"
}

variable "k8s_count" {
  default = "3"
}