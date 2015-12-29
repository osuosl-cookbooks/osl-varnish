name             'osl-varnish'
maintainer       'Oregon State University'
maintainer_email 'systems@osuosl.org'
license          'Apache 2.0'
description      'OSL wrapper cookbook for varnish'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends          'varnish'
depends          'firewall'

supports         'centos', '~> 6.0'
