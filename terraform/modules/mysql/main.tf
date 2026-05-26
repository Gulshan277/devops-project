terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_container" "mysql" {
  name  = "mysql"
  image = "mysql:8"

  env = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=devops"
  ]

  ports {
    internal = 3306
    external = 3306
  }

  networks_advanced {
    name = var.network_name
  }
}
