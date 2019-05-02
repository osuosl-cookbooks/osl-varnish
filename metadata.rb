name             'osl-varnish'
maintainer       'Oregon State University'
maintainer_email 'systems@osuosl.org'
license          'Apache-2.0'
issues_url       'https://github.com/osuosl-cookbooks/osl-varnish/issues'
source_url       'https://github.com/osuosl-cookbooks/osl-varnish'
description      'OSL wrapper cookbook for varnish'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'
chef_version     '>= 13.8.5' if respond_to?(:chef_version)

depends          'varnish'
depends          'firewall'

supports         'centos', '~> 6.0'
