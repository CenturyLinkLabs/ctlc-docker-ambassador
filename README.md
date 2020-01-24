## NOTE

This repo is no longer being maintained. Users are welcome to fork it, but we make no warranty of its functionality.

ctlc-docker-ambassador
======================

Note: Inspired by svendowideit/ambassador, but it is not a Trusted Image and uses top to keep-alive which uses too much CPU. This version uses watch ls instead and is a Trusted Image.

*Ambassador Pattern Linking*

Ambassadors are containers who's sole purpose is to help connect containers across multiple hosts.

Read more at https://labs.ctl.io/ambassadors-how-to-link-docker-containers-across-servers

	# start actual MySQL server
	$ docker run -d --name mysql ctlc/mysql

	# then to run it (on the host that has the real backend on it)
	$ docker run -d --link mysql:mysql --name mysql_ambassador -p 3306:3306 ctlc/ambassador

	# on the remote host, you can set up another ambassador setting environment variables for each remote port we want to proxy
	$ docker run -d --name mysql_ambassador_proxy -p 3306 -e MYSQL_PORT_3306_TCP=tcp://172.17.42.1:3306 ctlc/ambassador
