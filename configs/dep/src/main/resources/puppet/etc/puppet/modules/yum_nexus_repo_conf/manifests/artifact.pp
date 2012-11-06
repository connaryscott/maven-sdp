# Resource: yum_nexus_repo_conf::artifact
#
# This resource downloads Maven Artifacts from Nexus
#
# Parameters:
# [*gav*] : The artifact groupid:artifactid:version (mandatory)
# [*packaging*] : The packaging type (jar by default)
# [*classifier*] : The classifier (no classifier by default)
# [*repository*] : The repository such as 'public', 'central'...(mandatory)
# [*output*] : The output file (mandatory)
# [*ensure*] : If 'present' checks the existence of the output file (and downloads it if needed), if 'absent' deletes the output file, if not set redownload the artifact
#
# Actions:
# If ensure is set to 'present' the resource checks the existence of the file and download the artifact if needed.
# If ensure is set to 'absent' the resource deleted the output file.
# If ensure is not set or set to 'update', the artifact is re-downloaded.
#
# Sample Usage:
#  class yum_nexus_repo_conf {
#   url => http://edge.spree.de/nexus,
#   username => user,
#   password => password
# }
#
define yum_nexus_repo_conf::artifact(
	$gav,
	$packaging = "jar",
	$classifier = "",
	$repository
	) {

	
	include yum_nexus_repo_conf
	
	if ($yum_nexus_repo_conf::authentication) {
		$args = "-u ${yum_nexus_repo_conf::user} -p '${yum_nexus_repo_conf::pwd}'"
	} else {
		$args = ""
	}

	if ($classifier) {
		$includeClass = "-c ${classifier}"	
	}

	$cmd = "/opt/nexus-script/download-artifact-from-nexus.sh -a ${gav} -e ${packaging} ${$includeClass} -n ${yum_nexus_repo_conf::NEXUS_URL} -r ${repository}  $args -v"
	
}
