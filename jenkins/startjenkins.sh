#!/bin/bash

PATH=/bin:/usr/bin:/sbin:/usr/sbin

NAME=jenkins
#DAEMON=/usr/bin/daemon

[ -r /etc/default/$NAME ] && . /etc/default/$NAME


# load environments
if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
elif [ -r /etc/environment ]; then
  . /etc/environment
  export LANG LANGUAGE
fi

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions

do_start()
{
    $JAVA $JAVA_ARGS -jar $JENKINS_WAR $JENKINS_ARG
}

do_start
