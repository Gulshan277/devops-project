terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "haproxy" {
  name = "haproxy:2.8"

  build {
    context    = "${path.root}/../haproxy"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "haproxy" {
  name  = "haproxy"
  image = docker_image.haproxy.name

  ports {
    internal = 80
    external = 80
  }

  networks_advanced {
    name = var.network_name
  }

  depends_on = [
    var.apache_dependency,
    var.backend_dependency
  ]
}
