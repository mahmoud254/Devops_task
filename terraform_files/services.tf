resource "kubernetes_service" "nexus" {
  metadata {
    name = "nexus"
    namespace = "build"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.nexus.metadata.0.labels.app}"
    }
    port {
      node_port   = 30001
      port        = 8081
      target_port = 8081
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "docker" {
  metadata {
    name = "docker"
    namespace = "build"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.nexus.metadata.0.labels.app}"
    }
    port {
      node_port   = 30004
      port        = 8123
      target_port = 8123
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = "build"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.jenkins.metadata.0.labels.app}"
    }
    port {
      node_port   = 30002
      port        = 8080
      target_port = 8080

    }

    type = "NodePort"
  }
}



resource "kubernetes_service" "mysql_dev" {
  metadata {
    name = "mysqldev"
    namespace = "dev"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.mysql_dev.metadata.0.labels.app}"
    }
    port {
      port        = 3306
      target_port = 3306

    }

    type = "ClusterIP"
  }
}


resource "kubernetes_service" "mysql_test" {
  metadata {
    name = "mysqltest"
    namespace = "dev"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.mysql_test.metadata.0.labels.app}"
    }
    port {
      port        = 3306
      target_port = 3306

    }

    type = "ClusterIP"
  }
}