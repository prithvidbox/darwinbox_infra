#!/bin/bash

function start_all() {
  # Execute configuration script
  /root/configure.py

  # Start services
 
  if grep -Fxq "mysql" /etc/ansible/site.yml
  then
  /etc/init.d/mysql start
  fi
 
  if grep -Fxq "apache" /etc/ansible/site.yml
  then
  /etc/init.d/apache2 start
  cron

  # Expose a bash script for interactive mode
  /bin/bash
}

function reload_all() {
  echo "Reloading..."
 
  if grep -Fxq "mysql" /etc/ansible/site.yml
  then 
  /etc/init.d/mysql restart
  fi
 
  if grep -Fxq "apache" /etc/ansible/site.yml
  then
  /etc/init.d/apache2 restart
  if
}


function stop_all() {
  echo "Shutting down..."
 
  if grep -Fxq "mysql" /etc/ansible/site.yml
  then  
  /etc/init.d/mysql stop
  fi 
 
  if grep -Fxq "apache" /etc/ansible/site.yml
  then    
  /etc/init.d/apache2 stop
  fi
}

trap stop_all EXIT
trap reload_all SIGHUP

start_all
