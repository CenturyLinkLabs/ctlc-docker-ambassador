#!/bin/bash
rm -fr /etc/supervisor/conf.d/socat*
env | grep _TCP= | while read line; do
  name=$(echo $line | sed -e 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat_\1_\2_\3/')
  cmd=$(echo $line | sed -e 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat -ls TCP4-LISTEN:\1,fork,reuseaddr TCP4:\2:\3/')
      
  cat <<EOF > /etc/supervisor/conf.d/supervisor-$name.conf
[program:$name]
command=$cmd
numprocs=1
autostart=true
autorestart=true
EOF

done

exec supervisord -n
