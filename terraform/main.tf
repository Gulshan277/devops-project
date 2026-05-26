terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Network
resource "docker_network" "devops_net" {
  name = "devops-net"
}

# MYSQL
module "mysql" {
  source       = "./modules/mysql"
  network_name = docker_network.devops_net.name
}

# BACKEND
module "backend" {
  source           = "./modules/backend"
  network_name     = docker_network.devops_net.name
  mysql_dependency = module.mysql
}

# APACHE
module "apache" {
  source       = "./modules/apache"
  network_name = docker_network.devops_net.name
}

# HAPROXY
module "haproxy" {
  source             = "./modules/haproxy"
  network_name       = docker_network.devops_net.name
  apache_dependency  = module.apache
  backend_dependency = module.backend
}
