

sudo yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm;



sudo yum -y install epel-release yum-utils;


sudo yum-config-manager --enable pgdg12;


sudo yum install postgresql12-server postgresql12;


sudo /usr/pgsql-12/bin/postgresql-12-setup initdb;


sudo systemctl enable --now postgresql-12;


sudo firewall-cmd --add-service=postgresql --permanent;


sudo firewall-cmd --reload;


cd /tmp;

sudo wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm;

sudo yum install -y wkhtmltox-0.12.5-1.centos7.x86_64.rpm;

cd ..;

sudo yum install https://centos7.iuscommunity.org/ius-release.rpm -y;

sudo yum makecache fast;

sudo yum -y install python36u python36u-devel python36-pillow python36-lxml npm nodejs libxml2-devel libjpeg-devel libxml2 libxslt libxslt-devel libpng libjpeg openssl icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi python3-pip python3-setuptools git openldap-devel;

sudo yum groupinstall 'Development Tools' -y;

sudo npm install -g less less-plugin-clean-css -y;

sudo su - postgres -c "createuser -s odoo";

sudo adduser --system --home-dir=/opt/odoo --shell=/bin/bash -m odoo;

sudo mkdir /etc/odoo;


sudo mkdir /var/log/odoo/;

sudo chown -R odoo:odoo /opt/odoo/;

sudo chown -R odoo:odoo /var/log/odoo/;

sudo git clone --depth=1 https://github.com/odoo/odoo.git /opt/odoo/odoo;

sudo pip3.6 install  -r /opt/odoo/odoo/requirements.txt;

sudo su - odoo -c "/opt/odoo/odoo/odoo-bin --addons-path=/opt/odoo/odoo/addons -s --stop-after-init";

sudo mv /opt/odoo/.odoorc /etc/odoo/odoo.conf;

sudo sed -i "s,^\(logfile = \).*,\1"/var/log/odoo/odoo-server.log"," /etc/odoo/odoo.conf;


sudo ln -s /opt/odoo/odoo/odoo-bin /usr/bin/odoo;

sudo cp /opt/odoo/odoo/debian/odoo.service /usr/lib/systemd/system/;

sudo systemctl enable --now odoo.service;

sudo firewall-cmd --permanent --add-port=8069/tcp;

sudo firewall-cmd --reload;


 



