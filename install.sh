#!/bin/sh -e
#
#  install.sh
#
#  Copyright 2013 Le Duong <du@leduong.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
#
# configure
sed -i 's/DSHELL=.*\+/DSHELL=\/usr\/sbin\/nologin/' /etc/adduser.conf
echo "Ok: change /usr/sbin/nologin file /etc/adduser.conf"

sed -i 's/DIR_MODE=.*\+/DIR_MODE=0710/' /etc/adduser.conf
echo "Ok: change DIR_MODE=0710 file /etc/adduser.conf"

sed -i 's/SHELL=.*\+/SHELL=\/usr\/sbin\/nologin/' /etc/default/useradd
echo "Ok: change /usr/sbin/nologin file /etc/default/useradd"

echo "/bin/bash" >> /etc/shells
echo "Ok: add /usr/sbin/nologin to /etc/shells"

echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

# create template for default user
ln -s /etc/apache2/sites-available
mkdir -p /etc/skel/www
echo "<?php phpinfo();?>" > /etc/skel/www/phpinfo.php
echo "<h1>Hello World!!!</h1>" > /etc/skel/www/index.html
mkdir -p /etc/nginx/perl
cd /etc/nginx/perl
wget https://raw.github.com/loiphamvn/hosting-ununtu/master/etc/nginx/perl/Minify.pm
mkdir -p /root/conf
cd /root/conf
wget https://raw.github.com/loiphamvn/hosting-ununtu/master/conf/domain.conf
wget https://raw.github.com/loiphamvn/hosting-ununtu/master/conf/php.conf
wget https://raw.github.com/loiphamvn/hosting-ununtu/master/conf/mysql.conf
cd /root
wget https://raw.github.com/loiphamvn/hosting-ununtu/master/addweb.sh
chmod +x addweb.sh 
echo "finish, done"
echo "/root/addweb.sh [enter] to create new webhosting"