#
# make sure we have the correct repo file
#

class repoconfig {

  case $::sh_envloc {
    'dskd':  {
       class {'yum_nexus_repo_conf':
          url      => "https://${sdp.distribution.host}/nexus"
       }

      yum_nexus_repo_conf::artifact {'sh-sdp-repos-development-sdp-snapshots-rpm':
         gav        => "com.stubhub.sdp.repos.development:sh-sdp-repos-development-sdp-snapshots-rpm:1.0.0-SNAPSHOT",
         repository => "sdp-snapshots",
         packaging => "rpm"
      }

      yum_nexus_repo_conf::artifact {'sh-sdp-repos-development-sdp-thirdparty-rpm':
         gav        => "com.stubhub.sdp.repos.development:sh-sdp-repos-development-sdp-thirdparty-rpm:1.0.0-SNAPSHOT",
         repository => "sdp-snapshots",
         packaging => "rpm"
      }

      yum_nexus_repo_conf::artifact {'sh-sdp-repos-development-stubhub-snapshots-rpm':
         gav        => "com.stubhub.sdp.repos.development:sh-sdp-repos-development-stubhub-snapshots-rpm:1.0.0-SNAPSHOT",
         repository => "sdp-snapshots",
         packaging => "rpm"
      }

   }
}
