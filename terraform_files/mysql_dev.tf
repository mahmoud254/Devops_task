resource "kubernetes_pod" "mysql_dev" {

  metadata {
    name = "mysql"
    namespace= "${kubernetes_namespace.dev.id}"
    labels = {
      app = "mysql"
    }
  }

  spec {
    container {
      image = "${var.mysql_image}"
      name  = "mysql"

    }
  }

}