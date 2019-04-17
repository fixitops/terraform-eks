variable "namespace_name" {
  default = "nginx"
  type    = "string"
}

variable "nginx_deployment_name" {
  default = "nginx"
  type    = "string"
}

variable "nginx_service_name" {
  default = "nginx"
  type    = "string"
}

variable "nginx_pod_image" {
  default = "nginx:latest"
  type    = "string"
}

variable "nginx_pod_replica" {
  default = "3"
  type    = "string"
}