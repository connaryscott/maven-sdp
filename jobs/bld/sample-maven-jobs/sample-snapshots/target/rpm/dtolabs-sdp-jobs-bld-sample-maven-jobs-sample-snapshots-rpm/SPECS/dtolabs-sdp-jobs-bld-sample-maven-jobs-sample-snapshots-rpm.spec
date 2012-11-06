Name: dtolabs-sdp-jobs-bld-sample-maven-jobs-sample-snapshots-rpm
Version: 1.0.0
Release: SNAPSHOT20121106220706
Summary: DTO :: sdp :: jobs :: bld-sample-maven-jobs-sample-snapshots-rpm
License: XXX
Group: YYY
Requires: jenkins
autoprov: yes
autoreq: yes
BuildRoot: /home/chuck/workspace/maven-sdp/jobs/bld/sample-maven-jobs/sample-snapshots/target/rpm/dtolabs-sdp-jobs-bld-sample-maven-jobs-sample-snapshots-rpm/buildroot

%description

%install
if [ -e $RPM_BUILD_ROOT ];
then
  mv /home/chuck/workspace/maven-sdp/jobs/bld/sample-maven-jobs/sample-snapshots/target/rpm/dtolabs-sdp-jobs-bld-sample-maven-jobs-sample-snapshots-rpm/tmp-buildroot/* $RPM_BUILD_ROOT
else
  mv /home/chuck/workspace/maven-sdp/jobs/bld/sample-maven-jobs/sample-snapshots/target/rpm/dtolabs-sdp-jobs-bld-sample-maven-jobs-sample-snapshots-rpm/tmp-buildroot $RPM_BUILD_ROOT
fi

%files

%dir %attr(755,jenkins,jenkins) "/var/lib/jenkins/jobs/sample-snapshots"
%attr(644,jenkins,jenkins)  "/var/lib/jenkins/jobs/sample-snapshots/config.xml"
