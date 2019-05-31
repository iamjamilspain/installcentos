#!/bin/bash

#
# Taken from this URL: https://www.clouda.ca/blog/general/openshift-on-centos-7-quick-installation/
#

 cd /tmp
 sudo wget https://github.com/openshift/origin/releases/download/v1.3.0/openshift-origin-server-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit.tar.gz 
 sudo tar xf openshift-origin-server-*.tar.gz
 cd openshift-origin-server-*
 sudo mv k* o* /usr/local/sbin/


# /usr/local/bin/start_openshift.sh:
#!/bin/bash
cd /opt/openshift/
openshift start --public-master='https://<PUBLIC_IP>:8443' --master='https://<PRIVATE_IP>:8443'

# /etc/systemd/system/openshift.service:
#
[Unit]
Description=OpenShift Origin Server

[Service]
Type=simple
ExecStart=/usr/local/bin/start_openshift.sh



# Setting Service to restart
chmod u+x /usr/local/bin/start_openshift.sh
mkdir /opt/openshift/
systemctl daemon-reload
systemctl start openshift