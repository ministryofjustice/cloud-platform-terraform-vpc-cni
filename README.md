# cloud-platform-terraform-vpc-cni



[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-vpc-cni/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-vpc-cni/releases)

Terraform module that deploys cloud-platform aws vpc cni
## Usage

# For EKS clusters
module "aws_vpc_cni" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-vpc-cni=1.0.1"

}

<!--- BEGIN_TF_DOCS --->


<!--- END_TF_DOCS --->

## Reading Material
https://github.com/aws/amazon-vpc-cni-k8s

https://aws.amazon.com/blogs/containers/amazon-vpc-cni-increases-pods-per-node-limits/


