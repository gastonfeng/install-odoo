#!/usr/bin/env bash


#scp root@111.231.215.110:/sh/ubuntu/install_saas.sh odoo10.sh && chmod +x odoo10.sh && ./odoo10.sh

apt-get update | grep "Hit http\|Ign http" -C 10000 && echo "There are possible failures on fetching. Try apt-get update again"

apt-get install git -y
git clone https://github.com/gastonfeng/install-odoo.git -b 11.0
cd install-odoo
git checkout 11.0

INSTALL_DEPENDENCIES=yes \
INIT_POSTGRESQL=yes \
INIT_BACKUPS=yes \
INIT_NGINX=yes \
INIT_START_SCRIPTS=yes \
INIT_ODOO_CONFIG=yes \
INIT_USER=yes \
INIT_DIRS=yes \
CLONE_ODOO=yes \
CLONE_IT_PROJECTS_LLC=no \
CLONE_OCA=no \
UPDATE_ADDONS_PATH=yes \
ADD_AUTOINSTALL_MODULES="['ir_attachment_force_storage']" \
/bin/bash -x install-odoo-saas.sh