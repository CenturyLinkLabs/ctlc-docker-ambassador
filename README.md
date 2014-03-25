ctlc-docker-ambassador
======================

Note: Inspired by svendowideit/ambassador, but it is not a Trusted Image and uses top to keep-alive which uses too much CPU. This version uses watch ls instead and is a Trusted Image.

*Ambassador Pattern Linking*

Ambassadors are containers who's sole purpose is to help connect containers across multiple hosts.

Read more at http://www.centurylinklabs.com/ambassadors-how-to-link-docker-containers-across-servers

	# start actual MySQL server
	$ docker run -d -name mysql ctlc/mysql

	# then to run it (on the host that has the real backend on it)
	$ docker run -t -i -link mysql:mysql -name mysql_ambassador -p 3306:3306 ctlc/ambassador

	# on the remote host, you can set up another ambassador setting environment variables for each remote port we want to proxy
	$ docker run -t -i -name mysql_ambassador -expose 3306 -e MYSQL_PORT_3306_TCP=tcp://192.168.1.52:3306 ctlc/ambassador
