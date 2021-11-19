# cloud-platform-terraform-vpc-cni

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-vpc-cni/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-vpc-cni/releases)

Terraform module that deploys cloud-platform aws vpc cni
## Usage

# For EKS clusters
module "aws_vpc_cni" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-vpc-cni=1.0.1"

  depends_on               = [module.eks]
  eks_cluster_id           = module.eks.cluster_id
  modify_existing_resource = true
}

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| null | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |

## Inputs

No input.

## Outputs

No output.

<!--- END_TF_DOCS --->

## Reading Material
https://github.com/aws/amazon-vpc-cni-k8s

https://aws.amazon.com/blogs/containers/amazon-vpc-cni-increases-pods-per-node-limits/


