#!/bin/bash

NEXUS_URL=https://$(hostname)/nexus
username=admin
password=admin123

if ! ./configure.sh $NEXUS_URL $username $password
then
   echo "unable to configure nexus using url: ${NEXUS_URL}" 1>&2
   exit 1
fi

#SNAPSHOT repo artifcacts may be re-deployed
if ! ./createRepo.sh sdp-snapshots SNAPSHOT ALLOW_WRITE $NEXUS_URL $username $password 
then
    echo "unable to create sdp-snapshots" 1>&2
    exit 1
fi


#third-party release artifacts may be re-deployed (unlike a release repository)
if ! ./createRepo.sh sdp-thirdparty RELEASE ALLOW_WRITE $NEXUS_URL $username $password 
then
    echo "unable to create sdp-thirdparty" 1>&2
    exit 1
fi

#release artifacts may not be re-deployed 
if ! ./createRepo.sh sdp-releases RELEASE ALLOW_WRITE_ONCE $NEXUS_URL $username $password 
then
    echo "unable to create sdp-releases" 1>&2
    exit 1
fi


if ! ./createRepo.sh dto-releases RELEASE ALLOW_WRITE_ONCE $NEXUS_URL $username $password 
then
    echo "unable to create dto-releases" 1>&2
    exit 1
fi


if ! ./createRepo.sh dto-snapshots SNAPSHOT ALLOW_WRITE $NEXUS_URL $username $password 
then
    echo "unable to create dto-snapshots" 1>&2
    exit 1
fi

if ! ./createGroup.sh $NEXUS_URL $username $password sdp-public-snapshots sdp-snapshots 
then
    echo "unable to create group sdp-public-snapshots" 1>&2
    exit 1
fi

if ! ./createGroup.sh $NEXUS_URL $username $password sdp-public sdp-releases sdp-thirdparty  
then
    echo "unable to create group sdp-releases" 1>&2
    exit 1
fi

if ! ./createGroup.sh $NEXUS_URL $username $password dto-public dto-releases 
then
    echo "unable to create group dto-releases" 1>&2
    exit 1
fi

if ! ./createGroup.sh $NEXUS_URL $username $password  dto-public-snapshots dto-snapshots
then
    echo "unable to create group dto-public-snapshots" 1>&2
    exit 1
fi
