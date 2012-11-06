class {'yum_nexus_repo_conf':
    url      => "https://mcollective-centos62-64-3.local/nexus"
}

yum_nexus_repo_conf::artifact {'sdp-snapshots-repo':
   gav        => "com.stubhub.sdp.repos.development:sh-sdp-repos-development-sdp-snapshots-rpm:1.0.0-SNAPSHOT",
   repository => "sdp-snapshots",
   packaging => "rpm"
}
