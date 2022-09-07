# AWS ParallelCluster and Gromacs

This repository contains the instructions to install and run Gromacs using [AWS Parallelcluster](https://aws.amazon.com/hpc/parallelcluster/).


## Instructions:
* Install AWS ParallelCluster following the instructions [here](https://docs.aws.amazon.com/parallelcluster/latest/ug/install-v3-parallelcluster.html)
* Deploy your cluster
* Login to the cluster head node
* Download and run the ```gromacs-install.sh``` script (it will download and install Gromacs using Spack)
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

