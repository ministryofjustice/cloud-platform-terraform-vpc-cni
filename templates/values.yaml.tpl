
# This default name override is to maintain backwards compatability with
# existing naming
nameOverride: aws-node

init:
  image:
    tag: "${appVersion}"
    region: us-west-2
    pullPolicy: Always

image:
  region: us-west-2
  tag: "${appVersion}"
  pullPolicy: Always


# The CNI supports a number of environment variable settings
# See https://github.com/aws/amazon-vpc-cni-k8s#cni-configuration-variables
env:
  ADDITIONAL_ENI_TAGS: "{}"
  AWS_VPC_CNI_NODE_PORT_SUPPORT: "true"
  AWS_VPC_ENI_MTU: "9001"
  AWS_VPC_K8S_CNI_CONFIGURE_RPFILTER: "false"
  AWS_VPC_K8S_CNI_CUSTOM_NETWORK_CFG: "false"
  AWS_VPC_K8S_CNI_EXTERNALSNAT: "false"
  AWS_VPC_K8S_CNI_LOG_FILE: "/host/var/log/aws-routed-eni/ipamd.log"
  AWS_VPC_K8S_CNI_LOGLEVEL: DEBUG
  AWS_VPC_K8S_CNI_RANDOMIZESNAT: "prng"
  AWS_VPC_K8S_CNI_VETHPREFIX: eni
  AWS_VPC_K8S_PLUGIN_LOG_FILE: "/var/log/aws-routed-eni/plugin.log"
  AWS_VPC_K8S_PLUGIN_LOG_LEVEL: DEBUG
  DISABLE_INTROSPECTION: "false"
  DISABLE_METRICS: "false"
  ENABLE_POD_ENI: "false"
  ENABLE_PREFIX_DELEGATION: "true"
  WARM_PREFIX_TARGET: "1"
  DISABLE_NETWORK_RESOURCE_PROVISIONING: "false"

# this flag enables you to use the match label that was present in the original daemonset deployed by EKS
# You can then annotate and label the original aws-node resources and 'adopt' them into a helm release
originalMatchLabels: true

crd:
  create: false

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name:
  annotations: {}
    # eks.amazonaws.com/role-arn: arn:aws:iam::AWS_ACCOUNT_ID:role/IAM_ROLE_NAME

livenessProbe:
  exec:
    command:
      - /app/grpc-health-probe
      - '-addr=:50051'
  initialDelaySeconds: 60

readinessProbe:
  exec:
    command:
      - /app/grpc-health-probe
      - '-addr=:50051'
  initialDelaySeconds: 1

resources:
  requests:
    cpu: 10m
