maven-sdp
=========

a reference implementation of a service delivery platform using maven

this implementation is based on recent implementations using best maven practices for building and deploying an SDP using maven build and a maven repository.


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
