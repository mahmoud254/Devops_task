resource "kubernetes_pod" "mysql_test" {

  metadata {
    name = "mysql"
    namespace= "${kubernetes_namespace.test.id}"
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