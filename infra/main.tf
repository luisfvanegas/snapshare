resource "kubernetes_horizontal_pod_autoscaler_v2" "snapshare" {
  metadata {
    name      = "snapshare-hpa"
    namespace = var.namespace
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "snapshare"
    }
    min_replicas = 2
    max_replicas = 6
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = 70
        }
      }
    }
  }
}

resource "kubernetes_pod_disruption_budget_v1" "snapshare" {
  metadata {
    name      = "snapshare-pdb"
    namespace = var.namespace
  }

  spec {
    min_available = 1
    selector {
      match_labels = {
        app = "snapshare"
      }
    }
  }
}
