name             'osl-varnish'
maintainer       'Oregon State University'
maintainer_email 'systems@osuosl.org'
license          'Apache-2.0'
chef_version     '>= 12.18' if respond_to?(:chef_version)
issues_url       'https://github.com/osuosl-cookbooks/osl-varnish/issues'
source_url       'https://github.com/osuosl-cookbooks/osl-varnish'
description      'OSL wrapper cookbook for varnish'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

depends          'varnish'
depends          'firewall'

supports         'centos', '~> 6.0'
