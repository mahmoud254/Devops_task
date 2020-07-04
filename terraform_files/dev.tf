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
      image = "mahmom/mysql:v1.2"
      name  = "mysql"

    }
  }

}