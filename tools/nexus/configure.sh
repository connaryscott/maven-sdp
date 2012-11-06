#!/bin/bash

if [ $# -ne 3 ]
then
   echo "need offical nexus url, username, password as arguments, example:" 1>&2
   echo "https://$(hostname)/nexus username password" 1>&2
   exit 1
fi

nexusUrl=$1
username=$2
password=$3

currentSettings=$(mktemp)
echo "retriving settings from:  ${nexusUrl}/service/local/global_settings/current"
if ! curl -s -k -H "Content-Type: application/xml" -f -X GET  -u ${username}:${password} ${nexusUrl}/service/local/global_settings/current > ${currentSettings}
then
   echo "failed retrieving settings from api service: ${nexusUrl}/service/local/global_settings/current" 1>&2
   exit 1
fi

echo "adjusting forceBaseUrl and baseUrl"
if ! sed -i -e "s,.*<forceBaseUrl>.*,<forceBaseUrl>true</forceBaseUrl>," -e "s,.*<baseUrl>.*,<baseUrl>${nexusUrl}</baseUrl>," ${currentSettings}
then
   echo "unable to stream edit temporary xml file: ${currentSettings}" 1>&2
   exit 1
fi


echo "posting new settings to:  ${nexusUrl}/service/local/global_settings/current"
if ! curl -k -H "Accept: application/xml" -H "Content-Type: application/xml" -d "@${currentSettings}" -f -X PUT  -u ${username}:${password} ${nexusUrl}/service/local/global_settings/current
then
   echo "failed uploading settings to api service: ${nexusUrl}/service/local/global_settings/current" 1>&2
   exit 1
fi
