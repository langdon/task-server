#!/bin/bash
if [ ! -f ./config-complete ] ; then
    taskd init
    
    cd /etc/pki/taskd/
    ./generate
    
    cp client.cert.pem $TASKDDATA
    cp client.key.pem  $TASKDDATA
    cp server.cert.pem $TASKDDATA
    cp server.key.pem  $TASKDDATA
    cp server.crl.pem  $TASKDDATA
    cp ca.cert.pem     $TASKDDATA
    
    taskd config --force client.cert $TASKDDATA/client.cert.pem
    taskd config --force client.key $TASKDDATA/client.key.pem
    taskd config --force server.cert $TASKDDATA/server.cert.pem
    taskd config --force server.key $TASKDDATA/server.key.pem
    taskd config --force server.crl $TASKDDATA/server.crl.pem
    taskd config --force ca.cert $TASKDDATA/ca.cert.pem

    taskd config server localhost:53589

    taskd log $TASKDDATA/logs/taskd.log
    taskd pid.file $TASKDDATA/run/taskd.pid
    
fi

touch ./config-complete
