#
# base module
# calls out classes from other manifests for basic system configuration
#

# TODO, addd repoconfig so that /etc/yum.repos.d is configured
# include repoconfig

class base {
  include facts
  include app_deploy
}
