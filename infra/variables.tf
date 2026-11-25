variable "kubeconfig" {
  type        = string
  description = "Path al kubeconfig temporal de GitHub Actions"
}

variable "namespace" {
  type        = string
  description = "Namespace de despliegue"
}
