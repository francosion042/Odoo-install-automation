

yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm;



yum -y install epel-release yum-utils;


yum-config-manager --enable pgdg12;


yum install postgresql12-server postgresql12;


/usr/pgsql-12/bin/postgresql-12-setup initdb;


systemctl enable --now postgresql-12;


firewall-cmd --add-service=postgresql --permanent;


firewall-cmd --reload;


cd /tmp;

wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm;

yum install -y wkhtmltox-0.12.5-1.centos7.x86_64.rpm;

cd ..;

yum install https://centos7.iuscommunity.org/ius-release.rpm -y;

yum makecache fast;

yum -y install python36u python36u-devel python36-pillow python36-lxml npm nodejs libxml2-devel libjpeg-devel libxml2 libxslt libxslt-devel libpng libjpeg openssl icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi python3-pip python3-setuptools git openldap-devel;

yum groupinstall 'Development Tools' -y;

npm install -g less less-plugin-clean-css -y;

su - postgres -c "createuser -s odoo";


adduser --system --home-dir=/opt/odoo --shell=/bin/bash -m odoo;


mkdir /etc/odoo;


mkdir /var/log/odoo/;


chown -R odoo:odoo /opt/odoo/;


chown -R odoo:odoo /var/log/odoo/;


git clone --depth=1 https://github.com/odoo/odoo.git /opt/odoo/odoo;


pip3.6 install  -r /opt/odoo/odoo/requirements.txt;


su - odoo -c "/opt/odoo/odoo/odoo-bin --addons-path=/opt/odoo/odoo/addons -s --stop-after-init";


mv /opt/odoo/.odoorc /etc/odoo/odoo.conf;


sed -i "s,^\(logfile = \).*,\1"/var/log/odoo/odoo-server.log"," /etc/odoo/odoo.conf;


ln -s /opt/odoo/odoo/odoo-bin /usr/bin/odoo;


cp /opt/odoo/odoo/debian/odoo.service /usr/lib/systemd/system/;


systemctl enable --now odoo.service;


firewall-cmd --permanent --add-port=8069/tcp;


firewall-cmd --reload;


 



