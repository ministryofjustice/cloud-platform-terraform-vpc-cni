
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

# This is to adopt the resources into a release as guided in helm chart
# https://github.com/aws/eks-charts/tree/master/stable/aws-vpc-cni#adopting-the-existing-aws-node-resources-in-an-eks-cluster
resource "null_resource" "modify_existing_resource" {
  count = var.modify_existing_resource ? 1 : 0
  provisioner "local-exec" {
    command = ("/bin/bash ${path.module}/templates/modify-existing-resource.sh")
    environment = {
      helm_release_name = "aws-vpc-cni"
      namespace_name    = "kube-system"
    }
  }
  triggers = {
    module_eks = var.eks_cluster_id
  }
}
