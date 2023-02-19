terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~>2.13.0"
        }
    }
}
provider "docker" {}

resource "docker_image" "docker_image_of_choice" {
  name  = "${var.image_name}:${var.image_version}"
  keep_locally = false
}

variable "image_name" {
    description = "Name of the docker image"
    type = string
    default = "nginx"
}

variable "image_version" {
    description = "Version of the docker image"
    type = string
    default = "latest"
}

output "image_information" {
    description = "Name of the docker image pulled"
    value = docker_image.docker_image_of_choice.name
}