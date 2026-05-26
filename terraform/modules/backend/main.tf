terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "backend" {
  name = "backend-java"

  build {
    context    = "${path.root}/../backend-java"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.name

  ports {
    internal = 8080
    external = 8080
  }

  networks_advanced {
    name = var.network_name
  }

  depends_on = [var.mysql_dependency]
}
