#!/bin/bash

component=$1
dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/yeswanthrepaka/ansible-roles-roboshop-tf.git

cd ansible-roles-roboshop-tf
ansible-playbook -e component=$component roboshop.sh