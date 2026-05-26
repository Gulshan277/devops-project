terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "apache" {
  name = "apache-frontend"

  build {
    context    = "${path.root}/../frontend-apache"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "apache" {
  name  = "apache"
  image = docker_image.apache.name

  ports {
    internal = 80
    external = 8081
  }

  networks_advanced {
    name = var.network_name
  }
}
