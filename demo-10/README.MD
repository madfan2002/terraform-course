# VPC Architecture is below (N.Virginia/us-east-1)

# 1 VPC Per Region, with 6 subnets ( 3 public subnets + 3 private subnets )

# In this demo/example we create a VPC with 3 public subnets and 3 private subnets, 1 route table excluding default and place and EC2 instance in public subnet main-public-1a

# Default route table will connect public subnets to internet gateway

# nat gateway will connect the private subnets to internet gateway

| Range          | From        | To                 |
| -------------- | ----------- | ------------------ |
| 10.0.0.0/8     | 10.0.0.0    | 10.255.255.255.255 |
| 172.16.0.0/12  | 172.16.0.0  | 172.31.255.255     |
| 192.168.0.0/16 | 192.168.0.0 | 192.168.255.255    |

# Subnet masks and CIDR range

| Range          | From        | To                 |
| -------------- | ----------- | ------------------ |
| 10.0.0.0/8     | 10.0.0.0    | 10.255.255.255.255 |
| 172.16.0.0/12  | 172.16.0.0  | 172.31.255.255     |
| 192.168.0.0/16 | 192.168.0.0 | 192.168.255.255    |

# Guidelines for CIDR, Network mask, IP addresses with examples as below

| Range       | Network mask    | Total addresses | Description                                     | Examples                         |
| ----------- | --------------- | --------------- | ----------------------------------------------- | -------------------------------- |
| 10.0.0.0/8  | 255.0.0.0       | 16,777,214      | Full 10.x.x.x range                             | 10.0.0.1, 10.100.200.20          |
| 10.0.0.0/16 | 255.255.0.0     | 65,536          | What we used for our VPC                        | 10.0.5.1, 10.0.20.2 , 10.0.100.3 |
| 10.1.0.0/16 | 255.255.0.0     | 65,536          | What we can use for another VPC                 | 10.1.5.1, 10.1.20.2, 10.1.100.3  |
| 10.0.0.0/24 | 255.255.255.0   | 256             | All addresses within from 10.0.0.0-10.0.0.255   | 10.0.0.1, 10.0.0.2, 10.0.0.3     |
| 10.0.1.0/24 | 255.255.255.0   | 256             | All addresses within from 10.0.1.0 - 10.0.1.255 | 10.0.1.1, 10.0.1.2, 10.0.1.3     |
| 10.0.0.5/32 | 255.255.255.255 | 1               | Single host                                     | 10.0.0.5                         |

# AWS VPC Created by Terraform

![alt](./VPC-AWS.jpg)

# AWS EC2 instance created by Terraform and a EBS => Elastic Block Storage is added
# To check the storage, run the commands
# ssh -i rhushi-keypair-private ubuntu@ec2-dns-name-from-aws
# Terminal prompt will change to ubuntu@machine-name
# Run sudo -s
# Run df -h
Filesystem                Size  Used Avail Use% Mounted on
/dev/root                 7.7G  1.3G  6.5G  17% /
devtmpfs                  233M     0  233M   0% /dev
tmpfs                     238M     0  238M   0% /dev/shm
tmpfs                      48M  792K   47M   2% /run
tmpfs                     5.0M     0  5.0M   0% /run/lock
tmpfs                     238M     0  238M   0% /sys/fs/cgroup
/dev/loop0                 34M   34M     0 100% /snap/amazon-ssm-agent/3552
/dev/loop2                 71M   71M     0 100% /snap/lxd/19647
/dev/loop3                 33M   33M     0 100% /snap/snapd/11588
/dev/loop1                 56M   56M     0 100% /snap/core18/1997
/dev/mapper/data-volume1   20G   45M   19G   1% /data
tmpfs                      48M     0   48M   0% /run/user/1000
# Run ls /dev/data/volume1 =-> Returns the same /dev/data/volume1
# Run pvdisplay  ( This is physical volume )
root@ip-10-0-1-243:/home/ubuntu# pvdisplay
  --- Physical volume ---
  PV Name               /dev/xvdh
  VG Name               data
  PV Size               20.00 GiB / not usable 4.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              5119
  Free PE               0
  Allocated PE          5119
  PV UUID               f0Jc5h-MYpd-K1bJ-sGyQ-1HPx-V5rU-QiX09S
# Run lvdisplay  (This is a logical volume )
--- Logical volume ---
  LV Path                /dev/data/volume1
  LV Name                volume1
  VG Name                data
  LV UUID                2sa1gy-ItZj-2v4l-xjcG-6bud-1aJl-1FPJu7
  LV Write Access        read/write
  LV Creation host, time ip-10-0-1-243, 2021-05-30 15:09:28 +0000
  LV Status              available
  # open                 1
  LV Size                <20.00 GiB
  Current LE             5119
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
![alt](./EC2-VPC.jpg)

# Logical Architecture

![alt](./vpc.drawio.svg)
