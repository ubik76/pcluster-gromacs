# AWS ParallelCluster and Gromacs

This repository contains the instructions to install and run Gromacs using [AWS Parallelcluster](https://aws.amazon.com/hpc/parallelcluster/).


## Instructions:
* Install AWS ParallelCluster following the instructions [here](https://docs.aws.amazon.com/parallelcluster/latest/ug/install-v3-parallelcluster.html)
* Prepare the cluster configuration:
   * edit the ```conf``` file with the data from your AWS account
   * run the ```pcluster-config.sh``` script
* Deploy your cluster:
```
pcluster create-cluster --cluster-name gromacs --cluster-configuration my-cluster-config.yaml
```
* Once the cluster is deployed, login to the cluster head node:
```
pcluster ssh --cluster-name gromacs -i <path_to_your_ssh_key>
```
* Download and run the ```gromacs-install.sh``` script (it will download and install Gromacs using Spack):
```
wget https://raw.githubusercontent.com/ubik76/pcluster-gromacs/main/gromacs-install.sh
chmod +x gromacs-install.sh
./gromacs-install.sh
source /home/ec2-user/.bashrc
```
* Submit your job:
```
sbatch /shared/input/gromacs/submit.sh
```
* If you want to visualize the results:
   * wait for the job to be completed
   * open a DCV Session to the head node
   * start VMD and visualize the output:

```
cd /shared/jobs/101
vmd
```

