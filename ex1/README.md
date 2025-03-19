Pulled ubuntu image and ran the container locally
	- docker run -it ubuntu

Ran apt update to update the package repo
	- apt update

Installed dnsutils to be able to use dig

	- apt install dnsutils

Used +short to only get the ip address

	- dig +short cloudflare.com
 
output: 104.16.132.229
        104.16.133.229 
 
Installed vim as a text editor

	 - apt install vim

Added "8.8.8.8 google-dns" to the hosts file to map ip to dns locally (it bypasses further dns lookup and maps the hostname directly to the ip)

	- vim /etc/hosts
  
Installed netcat to check google-dns for open DNS port 

 	- apt install netcat-openbsd
  
	- nc -zv google-dns 53 : -z means we use the command just to scan ports and -v stands for verbose

![Alt text](https://github.com/Iancu-Fabian/Tremend-internship/blob/bd0e28169432652f3aa7e700390e0149a413876f/screenshots/Screenshot%202025-03-19%20at%2011.20.33.png)


Edited the resolv.conf file

	- vim /etc/resolv.conf
 
	- changed nameserver to 8.8.8.8
 
Ran dig cloudflare.com again and got the same result (not sure if I should've got something different)

Installed nginx and started the service

	- apt install nginx
 
	- service nginx start
 
	- service nginx status
 
	output: * nginx is running
 
Checked the nginx port by using the -tuapen options when running netstat. T and u stand for tcp and udp, a displays all active connections, p displays the pid, e shows extra information (such as the user) and n shows the ip adresses in numeric format.

	- netstat -tuapen | grep nginx

bonus:

Went to one of the configuration files specified in nginx.conf (could have also went to sites-available/default) and changed the port nginx is listening on

	- vim /etc/nginx/sites-enabled/default

![Alt text](https://github.com/Iancu-Fabian/Tremend-internship/blob/0fd6860e15a174934e1afc1428d4082b3d3629b1/screenshots/Screenshot%202025-03-18%20at%2019.27.58.jpg)

Went to /var/www/html, where the nginx index.html file is located and changed the title

	- vim /var/www/html/index.nginx-debian.html 

 ![Alt text](https://github.com/Iancu-Fabian/Tremend-internship/blob/bd0e28169432652f3aa7e700390e0149a413876f/screenshots/Screenshot%202025-03-18%20at%2019.30.30.png)

