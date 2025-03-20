#!/bin/bash

docker run -it --name ubuntu-container -d ubuntu /bin/bash

docker exec -it ubuntu-container apt update

docker exec -it ubuntu-container apt install -y dnsutils vim nginx netcat-openbsd net-tools

docker exec -it ubuntu-container dig +short cloudflare.com

docker exec -it ubuntu-container bash -c "echo '8.8.8.8 google-dns' >> /etc/hosts"

docker exec -it ubuntu-container nc -zv google-dns 53

docker exec -it ubuntu-container bash -c "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"

docker exec -it ubuntu-container dig +short cloudflare.com

docker exec -it ubuntu-container service nginx start

docker exec -it ubuntu-container service nginx status

docker exec -it ubuntu-container netstat -tuapen | grep nginx

docker exec -it ubuntu-container bash -c "sed -i 's/listen 80;/listen 8080;/' /etc/nginx/sites-enabled/default"

docker exec -it ubuntu-container bash -c "sed -i 's/<title>Welcome to nginx!/<title>My Custom Nginx Page/' /var/www/html/index.nginx-debian.html"

docker exec -it ubuntu-container service nginx restart

echo "done"

