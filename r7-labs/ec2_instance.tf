provider "aws" {
    region = "us-east-1"
}
resource "aws_network_interface" "tb_eni" {
  subnet_id                 =   "subnet-379d8818"
  private_ips               = [ "172.31.95.1" ]
}
resource "aws_instance" "webserver" {
  ami                       =   "ami-0574da719dca65348"
  instance_type             =   "t2.large"
  key_name                  =   "devlab_key"
  iam_instance_profile      =   "AmazonSSMRoleForInstancesQuickSetup"
  monitoring                =   false
  vpc_security_group_ids    =   ["sg-014814136f28d7558"]
  root_block_device {
    volume_size             =   10
    encrypted               =   false
    volume_type             =   "gp3"
  }
  tags = {
    Name                    =   "tb-support-ubuntu-webserver"
  }
  user_data                 =   <<EOF
  #! /bin/bash
  sudo apt-get update
  sudo apt-get install -y htop
  sudo apt-get install -y sysstat
  sudo useradd cdacosta
  sudo usermod -aG sudo cdacosta
  sudo echo "cdacosta ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
  EOF
}