apt-get install pptpd -y

cp ~/.dotfiles/misc/pptpd.conf /etc/pptpd.conf
cp ~/.dotfiles/misc/chap-secrets /etc/ppp/chap-secrets
cp ~/.dotfiles/misc/pptpd-options /etc/ppp/pptpd-options

vim +96 /etc/pptpd.conf
vim +3 /etc/ppp/chap-secrets

service pptpd restart

vim +28 /etc/sysctl.conf

sysctl -p
