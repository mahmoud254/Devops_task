resource "kubernetes_namespace" "build" {
  metadata {
    name = "build"
  }
}




resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}



resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}