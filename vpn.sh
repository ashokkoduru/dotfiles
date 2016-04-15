apt-get install pptpd -y

vim /etc/pptpd.conf
> localip 10.0.0.1
> remoteip 10.0.0.100-200

vim /etc/ppp/chap-secrets
> box1 pptpd <password> *

vim /etc/ppp/pptpd-options
> ms-dns 8.8.8.8
> ms-dns 8.8.4.4

service pptpd restart

vim /etc/sysctl.conf
> net.ipv4.ip_forward = 1

sysctl -p
