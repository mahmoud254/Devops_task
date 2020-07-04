
resource "kubernetes_service_account" "jenkins" {
  metadata {
    name = "jenkins"
    namespace= "build"
  }
  secret {
    name = "${kubernetes_secret.example.metadata.0.name}"
  }
}

resource "kubernetes_secret" "example" {
  metadata {
    name = "jenkins"
  }
}


resource "kubernetes_role_binding" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "test"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.jenkins.metadata.0.name}"
    namespace = "build"
  }

}


resource "kubernetes_role_binding" "jenkins2" {
  metadata {
    name      = "jenkins"
    namespace = "dev"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.jenkins.metadata.0.name}"
    namespace = "build"
  }

}