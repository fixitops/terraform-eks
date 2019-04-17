resource "kubernetes_namespace" "example" {
  metadata {
    name = "${var.namespace_name}"
    labels {
      name = "nginx"
    }
    annotations {
      name = "nginx"
    }
  }
}
resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "${var.nginx_deployment_name}"
    namespace = "${var.namespace_name}"
    labels {
      app = "nginx"
    }
  }
  spec {
    replicas = "${var.nginx_pod_replica}"
    selector {
      match_labels {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels {
          app = "nginx"
        }
      }
      spec {
        container {
          name  = "${var.nginx_deployment_name}"
          image = "${var.nginx_pod_image}"
        }
      }
    }
  }
}
resource "kubernetes_service" "nginx" {
  metadata {
    name      = "${var.nginx_service_name}"
    namespace = "${var.namespace_name}"
  }
  spec {
    selector {
      app = "nginx"
    }
    port {
      port = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
