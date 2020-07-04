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
      image = "sonatype/nexus3:latest"
      name  = "nexus"
      port {
        container_port= "8123"
      }
      port {
        container_port= "8081"
      }
    }
  }

}




resource "kubernetes_pod" "jenkins" {
  metadata {
    name = "jenkins"
    namespace= "${kubernetes_namespace.build.id}"
        labels = {
      app = "jenkins"
    }
  }

  spec {
    container {
      image = "mahmom/myjenkins:v1.1"
      name  = "jenkins"

      volume_mount{
            mount_path = "/var/run"
            name = "docker-sock"
      }
      volume_mount{
            mount_path = "/usr/local/bin/kubectl"
            name = "kubectl"
            sub_path= "kubectl"
      }


    }
     service_account_name= "${kubernetes_service_account.jenkins.metadata.0.name}"
     automount_service_account_token= true
    volume{
      name = "docker-sock"
        host_path{
          path = "/var/run"
        }
    }
      volume{
      name = "kubectl"
      empty_dir= []
    } 
    init_container{
      name= "install-kubectl"
      image= "allanlei/kubectl"
      volume_mount{
        name= "kubectl"
        mount_path= "/data"
      }
      command= ["cp", "/usr/local/bin/kubectl", "/data/kubectl"]
    } 
  }

}

