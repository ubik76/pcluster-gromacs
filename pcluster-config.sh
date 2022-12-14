#!/bin/bash
source ./conf
cat > my-cluster-config.yaml << EOF
HeadNode:
  InstanceType: m5.2xlarge
  Ssh:
    KeyName: ${SSH_KEY_NAME}
  Networking:
    SubnetId: ${SUBNET_ID}
  LocalStorage:
    RootVolume:
      Size: 50
  Iam:
    AdditionalIamPolicies:
      - Policy: arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
  Dcv:
    Enabled: true
  Imds:
    Secured: true
Scheduling:
  Scheduler: slurm
  SlurmQueues:
    - Name: queue0
      ComputeResources:
        - Name: queue0-c5n18xlarge
          MinCount: 0
          MaxCount: 2
          InstanceType: c5n.18xlarge
          DisableSimultaneousMultithreading: true
          Efa:
            Enabled: true
      Networking:
        SubnetIds:
          - ${SUBNET_ID}
        PlacementGroup:
          Enabled: true
      ComputeSettings:
        LocalStorage:
          RootVolume:
            Size: 50
Region: ${AWS_REGION}
Image:
  Os: alinux2
SharedStorage:
  - Name: Ebs0
    StorageType: Ebs
    MountDir: /shared
    EbsSettings:
      VolumeType: gp2
      DeletionPolicy: Delete
      Size: '50'

EOF
