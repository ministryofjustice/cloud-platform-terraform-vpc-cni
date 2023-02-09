# cloud-platform-terraform-vpc-cni

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-vpc-cni/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-vpc-cni/releases)

Terraform module that deploys cloud-platform aws vpc cni
## Usage

# For EKS clusters
```
module "aws_vpc_cni" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-vpc-cni=1.0.1"

  depends_on               = [module.eks]
  eks_cluster_id           = module.eks.cluster_id
  modify_existing_resource = true
}
```
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



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.aws_vpc_cni](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.modify_existing_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name - used to name (id) the auth0 resources | `any` | n/a | yes |
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | trigger for null resource using eks\_cluster\_id | `any` | n/a | yes |
| <a name="input_modify_existing_resource"></a> [modify\_existing\_resource](#input\_modify\_existing\_resource) | Run script to modify\_existing\_resource | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->