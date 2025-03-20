cp nginx.conf /opt/homebrew/etc/nginx/nginx.conf
cp -r www/* /opt/homebrew/var/www/
sh reloadnginxconfig.sh
