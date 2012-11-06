maven-sdp
=========

a reference implementation of a service delivery platform using maven

this implementation is based on recent implementations using best maven practices for building and deploying an SDP using maven and a maven repository.

Requirements:

CentOS 6.2 is assumed

centos-release-6-2.el6.centos.7.x86_64 and its default enabled yum repos (/etc/yum.repos.d/CentOS-Base.repo)

apache-maven 3.0.4
   NOTE:  an apache-maven rpm is supplied for convenience

git

java openjdk-devel


Install apache-maven package using the yum localinstall in order to bootstrap all necessary dependencies

[chuck@mvn-sdp-0 maven-sdp]$ cd third-party/apache-maven/dist/
[chuck@mvn-sdp-0 dist]$ ls -rplt
total 4764
-r--r--r-- 1 chuck chuck 4874984 Oct 22 12:47 apache-maven-3.0.4-LATEST.noarch.rpm
[chuck@mvn-sdp-0 dist]$ sudo yum -y localinstall apache-maven-3.0.4-LATEST.noarch.rpm 
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror, refresh-packagekit, security
Setting up Local Package Process
Examining apache-maven-3.0.4-LATEST.noarch.rpm: apache-maven-3.0.4-6.noarch
Marking apache-maven-3.0.4-LATEST.noarch.rpm to be installed
Determining fastest mirrors
 * base: mirror.symnds.com
 * extras: mirrors.usc.edu
 * updates: mirror.symnds.com
Resolving Dependencies
--> Running transaction check
---> Package apache-maven.noarch 0:3.0.4-6 will be installed
--> Processing Dependency: createrepo for package: apache-maven-3.0.4-6.noarch
--> Processing Dependency: java-devel for package: apache-maven-3.0.4-6.noarch
--> Processing Dependency: rpm-build for package: apache-maven-3.0.4-6.noarch
--> Processing Dependency: rubygems for package: apache-maven-3.0.4-6.noarch
--> Running transaction check
---> Package createrepo.noarch 0:0.9.8-5.el6 will be installed
--> Processing Dependency: python-deltarpm for package: createrepo-0.9.8-5.el6.noarch
--> Processing Dependency: deltarpm for package: createrepo-0.9.8-5.el6.noarch
---> Package java-1.6.0-openjdk-devel.x86_64 1:1.6.0.0-1.50.1.11.5.el6_3 will be installed
--> Processing Dependency: java-1.6.0-openjdk = 1:1.6.0.0-1.50.1.11.5.el6_3 for package: 1:java-1.6.0-openjdk-devel-1.6.0.0-1.50.1.11.5.el6_3.x86_64
--> Processing Dependency: libjli.so(SUNWprivate_1.1)(64bit) for package: 1:java-1.6.0-openjdk-devel-1.6.0.0-1.50.1.11.5.el6_3.x86_64
--> Processing Dependency: libjli.so()(64bit) for package: 1:java-1.6.0-openjdk-devel-1.6.0.0-1.50.1.11.5.el6_3.x86_64
---> Package rpm-build.x86_64 0:4.8.0-27.el6 will be installed
--> Processing Dependency: rpm = 4.8.0-27.el6 for package: rpm-build-4.8.0-27.el6.x86_64
--> Processing Dependency: /usr/bin/gdb-add-index for package: rpm-build-4.8.0-27.el6.x86_64
---> Package rubygems.noarch 0:1.3.7-1.el6 will be installed
--> Processing Dependency: ruby(abi) = 1.8 for package: rubygems-1.3.7-1.el6.noarch
--> Processing Dependency: ruby-rdoc for package: rubygems-1.3.7-1.el6.noarch
--> Processing Dependency: /usr/bin/ruby for package: rubygems-1.3.7-1.el6.noarch
--> Running transaction check
---> Package deltarpm.x86_64 0:3.5-0.5.20090913git.el6 will be installed
---> Package gdb.x86_64 0:7.2-56.el6 will be installed
---> Package java-1.6.0-openjdk.x86_64 1:1.6.0.0-1.50.1.11.5.el6_3 will be installed
--> Processing Dependency: jpackage-utils >= 1.7.3-1jpp.2 for package: 1:java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64
--> Processing Dependency: tzdata-java for package: 1:java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64
--> Processing Dependency: rhino for package: 1:java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64
--> Processing Dependency: libgif.so.4()(64bit) for package: 1:java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64
---> Package python-deltarpm.x86_64 0:3.5-0.5.20090913git.el6 will be installed
---> Package rpm.x86_64 0:4.8.0-19.el6 will be updated
--> Processing Dependency: rpm = 4.8.0-19.el6 for package: rpm-libs-4.8.0-19.el6.x86_64
--> Processing Dependency: rpm = 4.8.0-19.el6 for package: rpm-python-4.8.0-19.el6.x86_64
---> Package rpm.x86_64 0:4.8.0-27.el6 will be an update
---> Package ruby.x86_64 0:1.8.7.352-7.el6_2 will be installed
---> Package ruby-libs.x86_64 0:1.8.7.352-7.el6_2 will be installed
--> Processing Dependency: libreadline.so.5()(64bit) for package: ruby-libs-1.8.7.352-7.el6_2.x86_64
---> Package ruby-rdoc.x86_64 0:1.8.7.352-7.el6_2 will be installed
--> Processing Dependency: ruby-irb = 1.8.7.352-7.el6_2 for package: ruby-rdoc-1.8.7.352-7.el6_2.x86_64
--> Running transaction check
---> Package compat-readline5.x86_64 0:5.2-17.1.el6 will be installed
---> Package giflib.x86_64 0:4.1.6-3.1.el6 will be installed
---> Package jpackage-utils.noarch 0:1.7.5-3.12.el6 will be installed
---> Package rhino.noarch 0:1.7-0.7.r2.2.el6 will be installed
--> Processing Dependency: jline for package: rhino-1.7-0.7.r2.2.el6.noarch
---> Package rpm-libs.x86_64 0:4.8.0-19.el6 will be updated
---> Package rpm-libs.x86_64 0:4.8.0-27.el6 will be an update
---> Package rpm-python.x86_64 0:4.8.0-19.el6 will be updated
---> Package rpm-python.x86_64 0:4.8.0-27.el6 will be an update
---> Package ruby-irb.x86_64 0:1.8.7.352-7.el6_2 will be installed
---> Package tzdata-java.noarch 0:2012f-1.el6 will be installed
--> Running transaction check
---> Package jline.noarch 0:0.9.94-0.8.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================================================================================================================
 Package                                         Arch                          Version                                               Repository                                                Size
====================================================================================================================================================================================================
Installing:
 apache-maven                                    noarch                        3.0.4-6                                               /apache-maven-3.0.4-LATEST.noarch                        5.3 M
Installing for dependencies:
 compat-readline5                                x86_64                        5.2-17.1.el6                                          base                                                     130 k
 createrepo                                      noarch                        0.9.8-5.el6                                           base                                                      81 k
 deltarpm                                        x86_64                        3.5-0.5.20090913git.el6                               base                                                      71 k
 gdb                                             x86_64                        7.2-56.el6                                            base                                                     2.3 M
 giflib                                          x86_64                        4.1.6-3.1.el6                                         base                                                      37 k
 java-1.6.0-openjdk                              x86_64                        1:1.6.0.0-1.50.1.11.5.el6_3                           updates                                                   25 M
 java-1.6.0-openjdk-devel                        x86_64                        1:1.6.0.0-1.50.1.11.5.el6_3                           updates                                                  8.5 M
 jline                                           noarch                        0.9.94-0.8.el6                                        base                                                      86 k
 jpackage-utils                                  noarch                        1.7.5-3.12.el6                                        base                                                      59 k
 python-deltarpm                                 x86_64                        3.5-0.5.20090913git.el6                               base                                                      27 k
 rhino                                           noarch                        1.7-0.7.r2.2.el6                                      base                                                     778 k
 rpm-build                                       x86_64                        4.8.0-27.el6                                          base                                                     125 k
 ruby                                            x86_64                        1.8.7.352-7.el6_2                                     base                                                     532 k
 ruby-irb                                        x86_64                        1.8.7.352-7.el6_2                                     base                                                     311 k
 ruby-libs                                       x86_64                        1.8.7.352-7.el6_2                                     base                                                     1.6 M
 ruby-rdoc                                       x86_64                        1.8.7.352-7.el6_2                                     base                                                     375 k
 rubygems                                        noarch                        1.3.7-1.el6                                           base                                                     206 k
 tzdata-java                                     noarch                        2012f-1.el6                                           updates                                                  154 k
Updating for dependencies:
 rpm                                             x86_64                        4.8.0-27.el6                                          base                                                     899 k
 rpm-libs                                        x86_64                        4.8.0-27.el6                                          base                                                     310 k
 rpm-python                                      x86_64                        4.8.0-27.el6                                          base                                                      55 k

Transaction Summary
====================================================================================================================================================================================================
Install      19 Package(s)
Upgrade       3 Package(s)

Total size: 47 M
Total download size: 42 M
Downloading Packages:
(1/21): compat-readline5-5.2-17.1.el6.x86_64.rpm                                                                                                                             | 130 kB     00:00     
(2/21): createrepo-0.9.8-5.el6.noarch.rpm                                                                                                                                    |  81 kB     00:00     
(3/21): deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm                                                                                                                          |  71 kB     00:00     
(4/21): gdb-7.2-56.el6.x86_64.rpm                                                                                                                                            | 2.3 MB     00:02     
(5/21): giflib-4.1.6-3.1.el6.x86_64.rpm                                                                                                                                      |  37 kB     00:00     
(6/21): java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64.rpm                                                                                                              |  25 MB     00:19     
(7/21): java-1.6.0-openjdk-devel-1.6.0.0-1.50.1.11.5.el6_3.x86_64.rpm                                                                                                        | 8.5 MB     00:05     
(8/21): jline-0.9.94-0.8.el6.noarch.rpm                                                                                                                                      |  86 kB     00:00     
(9/21): jpackage-utils-1.7.5-3.12.el6.noarch.rpm                                                                                                                             |  59 kB     00:00     
(10/21): python-deltarpm-3.5-0.5.20090913git.el6.x86_64.rpm                                                                                                                  |  27 kB     00:00     
(11/21): rhino-1.7-0.7.r2.2.el6.noarch.rpm                                                                                                                                   | 778 kB     00:00     
(12/21): rpm-4.8.0-27.el6.x86_64.rpm                                                                                                                                         | 899 kB     00:00     
(13/21): rpm-build-4.8.0-27.el6.x86_64.rpm                                                                                                                                   | 125 kB     00:00     
(14/21): rpm-libs-4.8.0-27.el6.x86_64.rpm                                                                                                                                    | 310 kB     00:00     
(15/21): rpm-python-4.8.0-27.el6.x86_64.rpm                                                                                                                                  |  55 kB     00:00     
(16/21): ruby-1.8.7.352-7.el6_2.x86_64.rpm                                                                                                                                   | 532 kB     00:00     
(17/21): ruby-irb-1.8.7.352-7.el6_2.x86_64.rpm                                                                                                                               | 311 kB     00:00     
(18/21): ruby-libs-1.8.7.352-7.el6_2.x86_64.rpm                                                                                                                              | 1.6 MB     00:01     
(19/21): ruby-rdoc-1.8.7.352-7.el6_2.x86_64.rpm                                                                                                                              | 375 kB     00:00     
(20/21): rubygems-1.3.7-1.el6.noarch.rpm                                                                                                                                     | 206 kB     00:00     
(21/21): tzdata-java-2012f-1.el6.noarch.rpm                                                                                                                                  | 154 kB     00:00     
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                               1.1 MB/s |  42 MB     00:36     
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Updating   : rpm-libs-4.8.0-27.el6.x86_64                                                                                                                                                    1/25 
  Updating   : rpm-4.8.0-27.el6.x86_64                                                                                                                                                         2/25 
  Installing : deltarpm-3.5-0.5.20090913git.el6.x86_64                                                                                                                                         3/25 
  Installing : jpackage-utils-1.7.5-3.12.el6.noarch                                                                                                                                            4/25 
  Installing : python-deltarpm-3.5-0.5.20090913git.el6.x86_64                                                                                                                                  5/25 
  Updating   : rpm-python-4.8.0-27.el6.x86_64                                                                                                                                                  6/25 
  Installing : createrepo-0.9.8-5.el6.noarch                                                                                                                                                   7/25 
  Installing : giflib-4.1.6-3.1.el6.x86_64                                                                                                                                                     8/25 
  Installing : tzdata-java-2012f-1.el6.noarch                                                                                                                                                  9/25 
  Installing : gdb-7.2-56.el6.x86_64                                                                                                                                                          10/25 
  Installing : rpm-build-4.8.0-27.el6.x86_64                                                                                                                                                  11/25 
  Installing : jline-0.9.94-0.8.el6.noarch                                                                                                                                                    12/25 
  Installing : rhino-1.7-0.7.r2.2.el6.noarch                                                                                                                                                  13/25 
  Installing : 1:java-1.6.0-openjdk-1.6.0.0-1.50.1.11.5.el6_3.x86_64                                                                                                                          14/25 
  Installing : 1:java-1.6.0-openjdk-devel-1.6.0.0-1.50.1.11.5.el6_3.x86_64                                                                                                                    15/25 
  Installing : compat-readline5-5.2-17.1.el6.x86_64                                                                                                                                           16/25 
  Installing : ruby-libs-1.8.7.352-7.el6_2.x86_64                                                                                                                                             17/25 
  Installing : ruby-1.8.7.352-7.el6_2.x86_64                                                                                                                                                  18/25 
  Installing : ruby-irb-1.8.7.352-7.el6_2.x86_64                                                                                                                                              19/25 
  Installing : ruby-rdoc-1.8.7.352-7.el6_2.x86_64                                                                                                                                             20/25 
  Installing : rubygems-1.3.7-1.el6.noarch                                                                                                                                                    21/25 
  Installing : apache-maven-3.0.4-6.noarch                                                                                                                                                    22/25 
  Cleanup    : rpm-python-4.8.0-19.el6.x86_64                                                                                                                                                 23/25 
  Cleanup    : rpm-libs-4.8.0-19.el6.x86_64                                                                                                                                                   24/25 
  Cleanup    : rpm-4.8.0-19.el6.x86_64                                                                                                                                                        25/25 

Installed:
  apache-maven.noarch 0:3.0.4-6                                                                                                                                                                     

Dependency Installed:
  compat-readline5.x86_64 0:5.2-17.1.el6  createrepo.noarch 0:0.9.8-5.el6                        deltarpm.x86_64 0:3.5-0.5.20090913git.el6                    gdb.x86_64 0:7.2-56.el6              
  giflib.x86_64 0:4.1.6-3.1.el6           java-1.6.0-openjdk.x86_64 1:1.6.0.0-1.50.1.11.5.el6_3  java-1.6.0-openjdk-devel.x86_64 1:1.6.0.0-1.50.1.11.5.el6_3  jline.noarch 0:0.9.94-0.8.el6        
  jpackage-utils.noarch 0:1.7.5-3.12.el6  python-deltarpm.x86_64 0:3.5-0.5.20090913git.el6       rhino.noarch 0:1.7-0.7.r2.2.el6                              rpm-build.x86_64 0:4.8.0-27.el6      
  ruby.x86_64 0:1.8.7.352-7.el6_2         ruby-irb.x86_64 0:1.8.7.352-7.el6_2                    ruby-libs.x86_64 0:1.8.7.352-7.el6_2                         ruby-rdoc.x86_64 0:1.8.7.352-7.el6_2 
  rubygems.noarch 0:1.3.7-1.el6           tzdata-java.noarch 0:2012f-1.el6                      

Dependency Updated:
  rpm.x86_64 0:4.8.0-27.el6                                    rpm-libs.x86_64 0:4.8.0-27.el6                                    rpm-python.x86_64 0:4.8.0-27.el6                                   


Complete!


Install a development Maven settings configuration, located in the tools/maven directory:

[chuck@mvn-sdp-0 maven-sdp]$ mkdir -p $HOME/.m2
[chuck@mvn-sdp-0 maven-sdp]$ cp tools/maven/settings-development.xml $HOME/.m2/settings.xml 


Configure bashrc

[chuck@mvn-sdp-0 third-party]$ tail /home/chuck/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
export M2_HOME=/opt/apache-maven-3.0.4
export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk.x86_64

export PATH=${M2_HOME}/bin:$PATH

Build and Install all roles, configurations, and other dependencies from the top level build module

[chuck@mvn-sdp-0 maven-sdp]$ mvn clean install
...
...



Bootstrap the Nexus Server 

Install the Development Repository Role (drp) Package

[chuck@mvn-sdp-0 maven-sdp]$ sudo yum --nogpgcheck localinstall roles/drp/target/rpm/dtolabs-sdp-roles-drp-rpm/RPMS/x86_64/dtolabs-sdp-roles-drp-rpm-*.rpm


Install the development drp configuration

[chuck@mvn-sdp-0 maven-sdp]$ sudo yum -y --nogpgcheck localinstall configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-*.rpm

Failed to set locale, defaulting to C
Loaded plugins: fastestmirror, refresh-packagekit, security
Setting up Local Package Process
Examining configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch.rpm: dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch
Marking configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch.rpm to be installed
Loading mirror speeds from cached hostfile
 * base: mirror.ncsa.illinois.edu
 * extras: mirrors.tummy.com
 * updates: mirrors.gigenet.com
Resolving Dependencies
--> Running transaction check
---> Package dtolabs-sdp-cfg-drp-development-rpm.noarch 0:1.0.0-SNAPSHOT20121106220658 will be installed
--> Processing Dependency: mod_ssl for package: dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch
--> Running transaction check
---> Package mod_ssl.x86_64 1:2.2.15-15.el6.centos.1 will be installed
--> Processing Dependency: httpd = 2.2.15-15.el6.centos.1 for package: 1:mod_ssl-2.2.15-15.el6.centos.1.x86_64
--> Running transaction check
---> Package httpd.x86_64 0:2.2.15-15.el6.centos will be updated
---> Package httpd.x86_64 0:2.2.15-15.el6.centos.1 will be an update
--> Processing Dependency: httpd-tools = 2.2.15-15.el6.centos.1 for package: httpd-2.2.15-15.el6.centos.1.x86_64
--> Running transaction check
---> Package httpd-tools.x86_64 0:2.2.15-15.el6.centos will be updated
---> Package httpd-tools.x86_64 0:2.2.15-15.el6.centos.1 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================================================================================================================
 Package                                        Arch              Version                                 Repository                                                                           Size
====================================================================================================================================================================================================
Installing:
 dtolabs-sdp-cfg-drp-development-rpm            noarch            1.0.0-SNAPSHOT20121106220658            /dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch             24 k
Installing for dependencies:
 mod_ssl                                        x86_64            1:2.2.15-15.el6.centos.1                base                                                                                 87 k
Updating for dependencies:
 httpd                                          x86_64            2.2.15-15.el6.centos.1                  base                                                                                813 k
 httpd-tools                                    x86_64            2.2.15-15.el6.centos.1                  base                                                                                 70 k

Transaction Summary
====================================================================================================================================================================================================
Install       2 Package(s)
Upgrade       2 Package(s)

Total size: 993 k
Total download size: 969 k
Is this ok [y/N]: N
Exiting on user Command
[chuck@mvn-sdp-0 maven-sdp]$ sudo yum -y --nogpgcheck localinstall configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-*.rpm
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror, refresh-packagekit, security
Setting up Local Package Process
Examining configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch.rpm: dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch
Marking configs/drp/development/target/rpm/dtolabs-sdp-cfg-drp-development-rpm/RPMS/noarch/dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch.rpm to be installed
Loading mirror speeds from cached hostfile
 * base: mirror.ncsa.illinois.edu
 * extras: mirrors.tummy.com
 * updates: mirrors.gigenet.com
Resolving Dependencies
--> Running transaction check
---> Package dtolabs-sdp-cfg-drp-development-rpm.noarch 0:1.0.0-SNAPSHOT20121106220658 will be installed
--> Processing Dependency: mod_ssl for package: dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch
--> Running transaction check
---> Package mod_ssl.x86_64 1:2.2.15-15.el6.centos.1 will be installed
--> Processing Dependency: httpd = 2.2.15-15.el6.centos.1 for package: 1:mod_ssl-2.2.15-15.el6.centos.1.x86_64
--> Running transaction check
---> Package httpd.x86_64 0:2.2.15-15.el6.centos will be updated
---> Package httpd.x86_64 0:2.2.15-15.el6.centos.1 will be an update
--> Processing Dependency: httpd-tools = 2.2.15-15.el6.centos.1 for package: httpd-2.2.15-15.el6.centos.1.x86_64
--> Running transaction check
---> Package httpd-tools.x86_64 0:2.2.15-15.el6.centos will be updated
---> Package httpd-tools.x86_64 0:2.2.15-15.el6.centos.1 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================================================================================================================
 Package                                        Arch              Version                                 Repository                                                                           Size
====================================================================================================================================================================================================
Installing:
 dtolabs-sdp-cfg-drp-development-rpm            noarch            1.0.0-SNAPSHOT20121106220658            /dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch             24 k
Installing for dependencies:
 mod_ssl                                        x86_64            1:2.2.15-15.el6.centos.1                base                                                                                 87 k
Updating for dependencies:
 httpd                                          x86_64            2.2.15-15.el6.centos.1                  base                                                                                813 k
 httpd-tools                                    x86_64            2.2.15-15.el6.centos.1                  base                                                                                 70 k

Transaction Summary
====================================================================================================================================================================================================
Install       2 Package(s)
Upgrade       2 Package(s)

Total size: 993 k
Total download size: 969 k
Downloading Packages:
(1/3): httpd-2.2.15-15.el6.centos.1.x86_64.rpm                                                                                                                               | 813 kB     00:07     
(2/3): httpd-tools-2.2.15-15.el6.centos.1.x86_64.rpm                                                                                                                         |  70 kB     00:00     
(3/3): mod_ssl-2.2.15-15.el6.centos.1.x86_64.rpm                                                                                                                             |  87 kB     00:00     
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                                97 kB/s | 969 kB     00:10     
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Updating   : httpd-tools-2.2.15-15.el6.centos.1.x86_64                                                                                                                                        1/6 
  Updating   : httpd-2.2.15-15.el6.centos.1.x86_64                                                                                                                                              2/6 
  Installing : 1:mod_ssl-2.2.15-15.el6.centos.1.x86_64                                                                                                                                          3/6 
  Installing : dtolabs-sdp-cfg-drp-development-rpm-1.0.0-SNAPSHOT20121106220658.noarch                                                                                                          4/6 
  Cleanup    : httpd-2.2.15-15.el6.centos.x86_64                                                                                                                                                5/6 
  Cleanup    : httpd-tools-2.2.15-15.el6.centos.x86_64                                                                                                                                          6/6 

Installed:
  dtolabs-sdp-cfg-drp-development-rpm.noarch 0:1.0.0-SNAPSHOT20121106220658                                                                                                                         

Dependency Installed:
  mod_ssl.x86_64 1:2.2.15-15.el6.centos.1                                                                                                                                                           

Dependency Updated:
  httpd.x86_64 0:2.2.15-15.el6.centos.1                                                         httpd-tools.x86_64 0:2.2.15-15.el6.centos.1                                                        

Complete!


Start the drp role/nexus service and (re)start the apache-server

[chuck@mvn-sdp-0 maven-sdp]$ sudo service nexus start
Starting Nexus OSS...
Started Nexus OSS.
[chuck@mvn-sdp-0 maven-sdp]$ sudo service httpd restart
Stopping httpd:                                            [  OK  ]
Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using mvn-sdp-0.local for ServerName
                                                           [  OK  ]

Execute post nexus configurations using the nexus tools script, configureNexus.sh, which will create needed repositories, repo groups, and adjust the baseUrl and forceBaseUrl settings


[chuck@mvn-sdp-0 nexus]$ cd tools/nexus
[chuck@mvn-sdp-0 nexus]$ ./configureNexus.sh 
retrieving settings from:  https://mvn-sdp-0.local/nexus/service/local/global_settings/current
adjusting forceBaseUrl and baseUrl
posting new settings to:  https://mvn-sdp-0.local/nexus/service/local/global_settings/current
created repository: sdp-snapshots
created repository: sdp-thirdparty
created repository: sdp-releases
created repository: stubhub-releases
created repository: stubhub-snapshots
created group: sdp-public-snapshots
created group: sdp-public
created group: stubhub-public
created group: stubhub-public-snapshots



Upload the third-party dependencies to the Maven Repository:


[chuck@mvn-sdp-0 maven-sdp]$ cd third-party/
[chuck@mvn-sdp-0 third-party]$ mvn clean deploy
[INFO] Scanning for projects...
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for org.apache.maven:apache-maven:rpm:3.0.4
[WARNING] 'build.plugins.plugin.version' for org.codehaus.mojo:exec-maven-plugin is missing. @ line 51, column 15
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for org.rubygems:rubygems:pom:1.8.11-3.fc16.1.noarch
[WARNING] 'build.plugins.plugin.version' for org.codehaus.mojo:build-helper-maven-plugin is missing. @ line 22, column 16
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO] 
[INFO] DTO :: sdp :: sdp-thirdparty :: pom
[INFO] DTO :: thirdparty :: activemq :: rpm
[INFO] DTO :: thirdparty :: activemq-info-provider :: rpm
[INFO] DTO :: apache :: maven :: rpm
[INFO] DTO :: thirdparty :: puppet :: rpm
[INFO] DTO :: thirdparty :: hiera :: rpm
[INFO] DTO :: thirdparty :: jdk :: rpm
[INFO] DTO :: thirdparty :: jenkins :: rpm
[INFO] DTO :: thirdparty :: activemq :: rpm
[INFO] DTO :: thirdparty :: mcollective-client :: rpm
[INFO] DTO :: thirdparty :: activemq :: rpm
[INFO] DTO :: thirdparty :: activemq :: rpm
[INFO] DTO :: thirdparty :: activemq :: rpm
[INFO] DTO :: thirdparty :: p4 :: rpm
[INFO] DTO :: thirdparty :: puppet :: rpm
[INFO] DTO :: thirdparty :: puppet-server :: rpm
[INFO] DTO :: thirdparty :: ruby-augeas :: rpm
[INFO] DTO :: thirdparty :: ruby-json :: rpm
[INFO] DTO :: org :: rubygems :: rpm
[INFO] DTO :: thirdparty :: ruby-json :: rpm
[INFO] DTO :: thirdparty :: ruby-shadow :: rpm
[INFO] DTO :: thirdparty :: jenkins :: rpm
[INFO] DTO :: thirdparty :: jenkins :: rpm
[INFO] DTO :: thirdparty :: tanukiwrapper :: rpm
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building DTO :: sdp :: sdp-thirdparty :: pom 1.1.0
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.4.1:clean (default-clean) @ sdp-thirdparty ---
[INFO] 
[INFO] --- maven-install-plugin:2.3.1:install (default-install) @ sdp-thirdparty ---
[INFO] Installing /home/chuck/workspace/maven-sdp/third-party/pom.xml to /home/chuck/.m2/repository/com/dtolabs/sdp/third-party/sdp-thirdparty/1.1.0/sdp-thirdparty-1.1.0.pom
[INFO] 
[INFO] --- maven-deploy-plugin:2.7:deploy (default-deploy) @ sdp-thirdparty ---
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/dtolabs/sdp/third-party/sdp-thirdparty/1.1.0/sdp-thirdparty-1.1.0.pom
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/dtolabs/sdp/third-party/sdp-thirdparty/1.1.0/sdp-thirdparty-1.1.0.pom (3 KB at 2.3 KB/sec)
Downloading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/dtolabs/sdp/third-party/sdp-thirdparty/maven-metadata.xml
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/dtolabs/sdp/third-party/sdp-thirdparty/maven-metadata.xml
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/dtolabs/sdp/third-party/sdp-thirdparty/maven-metadata.xml (321 B at 3.9 KB/sec)
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building DTO :: thirdparty :: activemq :: rpm 5.5.0-1.el6.noarch
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.4.1:clean (default-clean) @ activemq ---
[INFO] 
[INFO] --- build-helper-maven-plugin:1.7:attach-artifact (rpm) @ activemq ---
[INFO] 
[INFO] --- maven-install-plugin:2.3.1:install (default-install) @ activemq ---
[INFO] Installing /home/chuck/workspace/maven-sdp/third-party/activemq/pom.xml to /home/chuck/.m2/repository/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.pom
[INFO] Installing /home/chuck/workspace/maven-sdp/third-party/activemq/SOURCES/activemq-5.5.0-1.el6.noarch.rpm to /home/chuck/.m2/repository/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.rpm
[INFO] 
[INFO] --- maven-deploy-plugin:2.7:deploy (default-deploy) @ activemq ---
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.pom
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.pom (2 KB at 9.7 KB/sec)
Downloading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/maven-metadata.xml
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/maven-metadata.xml
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/maven-metadata.xml (328 B at 4.1 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.rpm
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/activemq/5.5.0-1.el6.noarch/activemq-5.5.0-1.el6.noarch.rpm (19738 KB at 2687.2 KB/sec)
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building DTO :: thirdparty :: activemq-info-provider :: rpm 5.5.0-1.el6.noarch
[INFO] ------------------------------------------------------------------------
...
...
...
[INFO] --- maven-deploy-plugin:2.7:deploy (default-deploy) @ tanukiwrapper ---
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/3.5.9-1.el6.x86_64/tanukiwrapper-3.5.9-1.el6.x86_64.pom
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/3.5.9-1.el6.x86_64/tanukiwrapper-3.5.9-1.el6.x86_64.pom (2 KB at 18.6 KB/sec)
Downloading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/maven-metadata.xml
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/maven-metadata.xml
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/maven-metadata.xml (333 B at 1.9 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/3.5.9-1.el6.x86_64/tanukiwrapper-3.5.9-1.el6.x86_64.rpm
Uploaded: https://localhost/nexus/content/repositories/sdp-thirdparty/com/puppetlabs/tanukiwrapper/3.5.9-1.el6.x86_64/tanukiwrapper-3.5.9-1.el6.x86_64.rpm (261 KB at 1244.4 KB/sec)
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] DTO :: sdp :: sdp-thirdparty :: pom ............... SUCCESS [2.782s]
[INFO] DTO :: thirdparty :: activemq :: rpm .............. SUCCESS [8.010s]
[INFO] DTO :: thirdparty :: activemq-info-provider :: rpm  SUCCESS [1.331s]
[INFO] DTO :: apache :: maven :: rpm ..................... SUCCESS [11.893s]
[INFO] DTO :: thirdparty :: puppet :: rpm ................ SUCCESS [0.677s]
[INFO] DTO :: thirdparty :: hiera :: rpm ................. SUCCESS [0.669s]
[INFO] DTO :: thirdparty :: jdk :: rpm ................... SUCCESS [16.318s]
[INFO] DTO :: thirdparty :: jenkins :: rpm ............... SUCCESS [8.146s]
[INFO] DTO :: thirdparty :: activemq :: rpm .............. SUCCESS [0.878s]
[INFO] DTO :: thirdparty :: mcollective-client :: rpm .... SUCCESS [0.624s]
[INFO] DTO :: thirdparty :: activemq :: rpm .............. SUCCESS [0.637s]
[INFO] DTO :: thirdparty :: activemq :: rpm .............. SUCCESS [7.406s]
[INFO] DTO :: thirdparty :: activemq :: rpm .............. SUCCESS [1.227s]
[INFO] DTO :: thirdparty :: p4 :: rpm .................... SUCCESS [1.267s]
[INFO] DTO :: thirdparty :: puppet :: rpm ................ SUCCESS [0.876s]
[INFO] DTO :: thirdparty :: puppet-server :: rpm ......... SUCCESS [0.645s]
[INFO] DTO :: thirdparty :: ruby-augeas :: rpm ........... SUCCESS [0.678s]
[INFO] DTO :: thirdparty :: ruby-json :: rpm ............. SUCCESS [0.647s]
[INFO] DTO :: org :: rubygems :: rpm ..................... SUCCESS [0.817s]
[INFO] DTO :: thirdparty :: ruby-json :: rpm ............. SUCCESS [0.433s]
[INFO] DTO :: thirdparty :: ruby-shadow :: rpm ........... SUCCESS [0.468s]
[INFO] DTO :: thirdparty :: jenkins :: rpm ............... SUCCESS [6.088s]
[INFO] DTO :: thirdparty :: jenkins :: rpm ............... SUCCESS [0.263s]
[INFO] DTO :: thirdparty :: tanukiwrapper :: rpm ......... SUCCESS [0.567s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:16.946s
[INFO] Finished at: Tue Nov 06 14:44:34 PST 2012
[INFO] Final Memory: 10M/24M
[INFO] ------------------------------------------------------------------------


Install the SDP Snapshots from the maven top level module


[chuck@mvn-sdp-0 maven-sdp]$ mvn clean deploy

[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] DTO :: sdp :: parent :: pom
[INFO] DTO :: sdp :: libraries :: parent
[INFO] DTO :: sdp :: lib :: jenkins-plugins-rpm
[INFO] DTO :: sdp :: libraries :: mcollective-plugins
[INFO] DTO :: sdp :: libraries :: mcollective-plugins-mcollective-plugin-mongo-discovery-rpm
[INFO] DTO :: sdp :: libraries :: mcollective-plugins-mcollective-plugin-meta-registration-rpm
[INFO] DTO :: sdp :: libraries :: rubygems
[INFO] DTO :: sdp :: lib :: rubygems-rubygem-stomp-rpm
[INFO] Stubhub :: sdp :: roles :: parent
[INFO] DTO :: sdp :: roles :: drp-rpm
[INFO] DTO :: sdp :: roles :: bld-rpm
[INFO] DTO :: sdp :: roles :: dep-rpm
[INFO] DTO :: sdp :: cfg :: parent
[INFO] DTO :: sdp :: cfg :: drp
[INFO] DTO :: sdp :: cfg :: drp-development-rpm
[INFO] DTO :: sdp :: cfg :: bld
[INFO] DTO :: sdp :: cfg :: bld-development-rpm
[INFO] DTO :: sdp :: cfg :: dep
[INFO] DTO :: sdp :: cfg :: dep-development-rpm
[INFO] DTO :: sdp :: nodes :: parent
[INFO] DTO :: sdp :: nodes :: development
[INFO] DTO :: sdp :: nodes :: localhost-rpm
[INFO] DTO :: sdp :: jobs :: parent
[INFO] DTO :: sdp :: jobs :: bld-parent
[INFO] DTO :: sdp :: jobs :: bld-sample-maven-jobs
[INFO] DTO :: sdp :: jobs :: bld-sample-maven-jobs-sample-snapshots-rpm
[INFO] DTO :: sdp :: jobs :: dep-parent
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building DTO :: sdp :: parent :: pom 1.0.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- maven-clean-plugin:2.4.1:clean (default-clean) @ dtolabs-sdp ---

[INFO] Installing /home/chuck/workspace/maven-sdp/pom.xml to /home/chuck/.m2/repository/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/dtolabs-sdp-1.0.0-SNAPSHOT.pom
[INFO]
[INFO] --- maven-deploy-plugin:2.7:deploy (default-deploy) @ dtolabs-sdp ---
Downloading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/maven-metadata.xml
603/603 B   ^M            ^MDownloaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/maven-metadata.xml (603 B at 1.2 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/dtolabs-sdp-1.0.0-20121106.225524-4.pom
2/4 KB      ^M4/4 KB   ^M         ^MUploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/dtolabs-sdp-1.0.0-20121106.225524-4.pom (4 KB at 42.1 KB/sec)
Downloading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/maven-metadata.xml
286/286 B   ^M            ^MDownloaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/maven-metadata.xml (286 B at 6.6 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/maven-metadata.xml
603/603 B   ^M            ^MUploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/1.0.0-SNAPSHOT/maven-metadata.xml (603 B at 6.8 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/maven-metadata.xml
286/286 B   ^M            ^MUploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/dtolabs-sdp/maven-metadata.xml (286 B at 2.3 KB/sec)
[INFO]
[INFO] ------------------------------------------------------------------------




...
...
...
[INFO] --- maven-deploy-plugin:2.7:deploy (default-deploy) @ dtolabs-sdp-jobs-dep ---
Downloading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/1.0.0-SNAPSHOT/maven-metadata.xml
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/1.0.0-SNAPSHOT/dtolabs-sdp-jobs-dep-1.0.0-20121106.225143-1.pom
Uploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/1.0.0-SNAPSHOT/dtolabs-sdp-jobs-dep-1.0.0-20121106.225143-1.pom (856 B at 12.1 KB/sec)
Downloading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/maven-metadata.xml
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/1.0.0-SNAPSHOT/maven-metadata.xml
Uploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/1.0.0-SNAPSHOT/maven-metadata.xml (621 B at 10.5 KB/sec)
Uploading: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/maven-metadata.xml
Uploaded: https://localhost/nexus/content/repositories/sdp-snapshots/com/dtolabs/sdp/jobs/dep/dtolabs-sdp-jobs-dep/maven-metadata.xml (304 B at 7.2 KB/sec)
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] DTO :: sdp :: parent :: pom ....................... SUCCESS [3.409s]
[INFO] DTO :: sdp :: libraries :: parent ................. SUCCESS [0.437s]
[INFO] DTO :: sdp :: lib :: jenkins-plugins-rpm .......... SUCCESS [13.881s]
[INFO] DTO :: sdp :: libraries :: mcollective-plugins .... SUCCESS [0.450s]
[INFO] DTO :: sdp :: libraries :: mcollective-plugins-mcollective-plugin-mongo-discovery-rpm  SUCCESS [1.329s]
[INFO] DTO :: sdp :: libraries :: mcollective-plugins-mcollective-plugin-meta-registration-rpm  SUCCESS [1.107s]
[INFO] DTO :: sdp :: libraries :: rubygems ............... SUCCESS [0.351s]
[INFO] DTO :: sdp :: lib :: rubygems-rubygem-stomp-rpm ... SUCCESS [8.462s]
[INFO] Stubhub :: sdp :: roles :: parent ................. SUCCESS [1.693s]
[INFO] DTO :: sdp :: roles :: drp-rpm .................... SUCCESS [30.522s]
[INFO] DTO :: sdp :: roles :: bld-rpm .................... SUCCESS [2.115s]
[INFO] DTO :: sdp :: roles :: dep-rpm .................... SUCCESS [1.530s]
[INFO] DTO :: sdp :: cfg :: parent ....................... SUCCESS [0.622s]
[INFO] DTO :: sdp :: cfg :: drp .......................... SUCCESS [3.583s]
[INFO] DTO :: sdp :: cfg :: drp-development-rpm .......... SUCCESS [3.380s]
[INFO] DTO :: sdp :: cfg :: bld .......................... SUCCESS [1.977s]
[INFO] DTO :: sdp :: cfg :: bld-development-rpm .......... SUCCESS [2.083s]
[INFO] DTO :: sdp :: cfg :: dep .......................... SUCCESS [2.222s]
[INFO] DTO :: sdp :: cfg :: dep-development-rpm .......... SUCCESS [2.743s]
[INFO] DTO :: sdp :: nodes :: parent ..................... SUCCESS [0.488s]
[INFO] DTO :: sdp :: nodes :: development ................ SUCCESS [0.510s]
[INFO] DTO :: sdp :: nodes :: localhost-rpm .............. SUCCESS [0.848s]
[INFO] DTO :: sdp :: jobs :: parent ...................... SUCCESS [0.462s]
[INFO] DTO :: sdp :: jobs :: bld-parent .................. SUCCESS [0.613s]
[INFO] DTO :: sdp :: jobs :: bld-sample-maven-jobs ....... SUCCESS [1.226s]
[INFO] DTO :: sdp :: jobs :: bld-sample-maven-jobs-sample-snapshots-rpm  SUCCESS [6.709s]
[INFO] DTO :: sdp :: jobs :: dep-parent .................. SUCCESS [0.271s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:36.528s
[INFO] Finished at: Tue Nov 06 14:51:43 PST 2012
[INFO] Final Memory: 14M/34M
[INFO] ------------------------------------------------------------------------




