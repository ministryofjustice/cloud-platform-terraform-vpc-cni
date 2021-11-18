
###############
# aws-vpc-cni #
###############

resource "helm_release" "aws_vpc_cni" {
  name       = "aws-vpc-cni"
  chart      = "aws-vpc-cni"
  repository = "https://aws.github.io/eks-charts"
  namespace  = "kube-system"
  version    = "1.1.10"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    appVersion  = "v1.9.3"
  })]

  depends_on = [
    null_resource.modify_existing_resource,
  ]
}

resource "null_resource" "modify_existing_resource" {
  provisioner "local-exec" {

    command = format("%s/modify-existing-resource.sh", path.module/templates)
    environment = {
      helm_release_name = "aws-vpc-cni"
      namespace_name    = "kube-system"
    }
  }
  triggers = {
    module.eks = var.triggers_resource
  }
}
