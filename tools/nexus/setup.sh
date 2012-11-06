#!/bin/bash

updateDrpRole() {
return 0
   pushd ../../roles/drp
      mvn clean install || return 1
      sudo yum  -y --nogpgcheck --disablerepo=sh-sdp-\* localinstall -y target/rpm/sh-sdp-roles-drp-rpm/RPMS/x86_64/sh-sdp-roles-drp-rpm*.rpm   || return 1
   popd
}

updateDrpRoleConfig() {
   pushd ../../configs/drp
      mvn -Dsdp.environment=development clean install || return 1
      sudo yum -y --nogpgcheck --disablerepo=sh-sdp-\* localinstall development/target/rpm/sh-sdp-cfg-drp-development-rpm/RPMS/noarch/sh-sdp-cfg-drp-development-*.rpm || return 1
   popd
}

if ! updateDrpRole
then
   echo "unable to update the drp role" 1>&2
   exit 1
fi

if ! updateDrpRoleConfig
then
   echo "unable to update the drp role configuration" 1>&2
   exit 1
fi

