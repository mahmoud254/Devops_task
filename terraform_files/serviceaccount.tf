
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


