#
# facts module for custom facts
#
class facts {
        file {'/usr/lib/ruby/site_ruby/1.8/facter/stubhub-common.rb':
                source  =>      'puppet:///modules/facts/stubhub-common.rb',
                owner   =>      'root',
                group   =>      'root',
                mode    =>      '0644',
        }
}
