
#!/bin/bash
sudo yum-config-manager --enable epel
sudo yum -y update
cd /home
sudo mkdir Installation
cd Installation
# download splunk package 
aws s3 cp --recursive s3://ecssplunk/ Installation
tar -xvf splunk-add-on-for-amazon-web-services_520.tgz
# install splunk add-on
cd /opt/splunkforwarder/bin
./splunk install app ./Installation/100000_paypal_gcpccg52_happyreturnsforwarder.spl
# downlaod spunk
wget -O splunk-8.2.3-cd0848707637-linux-2.6-x86_64.rpm 'https://download.splunk.com/products/splunk/releases/8.2.3/linux/splunk-8.2.3-cd0848707637-linux-2.6-x86_64.rpm'
# install splunk
sudo rpm -i splunk-8.2.3-cd0848707637-linux-2.6-x86_64.rpm
sudo service splunk start
