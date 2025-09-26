Create empty storage class (no provisioner)

Create VM with that class and container image e.g. quay.io/containerdisks/fedora:latest

Wait for PVC to get created but not bound. Create PV and it should bind. otherwise set volumeName in PVC to PV

Datavolume should import volume and start VM

Check permissions - needs uid and gid 107 on NFS mount
