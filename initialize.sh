#!/bin/bash

#---> Set permission for all shell scripts
chmod +x *.sh

#---> Initialize docker environment
cpath=`pwd`
cd docker
cp env-example .env
cd `echo $cpath`

#---> Initialize
git clone https://github.com/mymagic/open_hub.git --recurse-submodules
mkdir open_hub/protected/vendor
mkdir open_hub/protected/runtime
mkdir open_hub/public_html/assets
mkdir open_hub/public_html/uploads

#---> Configuration
cp open_hub/protected/config/main.dist.php open_hub/protected/config/main.php
cp open_hub/protected/config/console.dist.php open_hub/protected/config/console.php
cp open_hub/protected/config/params.dist.php open_hub/protected/config/params.php
cp open_hub/protected/config/path.dist.php open_hub/protected/config/path.php
cp open_hub/protected/config/module.dist.php open_hub/protected/config/module.php
cp open_hub/protected/data/malayName.txt.dist open_hub/protected/data/malayName.txt


#---> Composer Install
cpath=`pwd`
cd open_hub/protected/
sudo chmod -R g+w .git 
cd `echo $cpath`

#---> File installation

for d in open_hub/protected/modules/*; do
    echo "copy module dist config files... $d"
    cp "$d/config/main.dist.php" "$d/config/main.php"
    cp "$d/config/console.dist.php" "$d/config/console.php"
done