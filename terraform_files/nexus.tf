resource "kubernetes_pod" "nexus" {
  metadata {
    name = "nexus"
    namespace= "${kubernetes_namespace.build.id}"
    labels = {
      app = "nexus"
    }
  }

  spec {
    container {
      image = "${var.nexus_image}"
      name  = "nexus"
      port {
        container_port= "${var.docker_nexus_port}"
      }
      port {
        container_port= "8081"
      }
    }
  }

}





