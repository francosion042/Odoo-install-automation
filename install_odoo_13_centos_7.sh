

sudo adduser --system --shell=/bin/bash --home-dir=/opt/odoo -m odoo;



sudo mkdir /etc/odoo && mkdir /var/log/odoo/;



sudo yum install https://centos7.iuscommunity.org/ius-release.rpm -y && sudo yum update -y && yum upgrade -y && sudo yum groupinstall 'Development Tools' -y && sudo yum install python36u python36u-devel python36-pillow python36-lxml npm nodejs libxml2-devel libjpeg-devel libxml2 libxslt libxslt-devel wget libpng libjpeg openssl icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi python3-pip python3-setuptools git openldap-devel -y;



rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm && yum install postgresql10-server postgresql10 -y && /usr/pgsql-10/bin/postgresql-10-setup initdb && systemctl start postgresql-10.service && systemctl enable postgresql-10.service;



sudo npm install -g less less-plugin-clean-css -y;



git clone --depth=1 --branch=13.0 https://github.com/odoo/odoo.git /opt/odoo/odoo;



sudo chown odoo:odoo /opt/odoo/ -R && sudo chown odoo:odoo /var/log/odoo/ -R;



cd /opt/odoo/odoo && sudo pip3 install -r requirements.txt;



cd /tmp && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm && rpm -Uvh wkhtmltox-0.12.5-1.centos7.x86_64.rpm;



sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/ && sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/;



sudo su - postgres -c "createuser -s odoo";



sudo su - odoo -c "/opt/odoo/odoo/odoo-bin --addons-path=/opt/odoo/odoo/addons -s --stop-after-init";



sudo mv /opt/odoo/.odoorc /etc/odoo/odoo.conf;



sudo sed -i "s,^\(logfile = \).*,\1"/var/log/odoo/odoo-server.log"," /etc/odoo/odoo.conf;

sudo sed -i "s,^\(logrotate = \).*,\1"True"," /etc/odoo/odoo.conf;

sudo sed -i "s,^\(proxy_mode = \).*,\1"True"," /etc/odoo/odoo.conf;


sudo ln -s /opt/odoo/odoo/odoo-bin /usr/bin/odoo;


sudo cp /opt/odoo/odoo/debian/odoo.service /etc/systemd/system/odoo.service && chmod +x /etc/systemd/system/odoo.service && sudo systemctl daemon-reload && sudo systemctl start odoo && sudo systemctl enable odoo && chkconfig --levels 2345 odoo on;


