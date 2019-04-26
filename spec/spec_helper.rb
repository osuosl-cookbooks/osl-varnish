require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'osl-varnish' }

CENTOS_7 = {
  platform: 'centos',
<<<<<<< HEAD
  version: '7.4.1708',
=======
  version: '7.4.1708'
>>>>>>> d31a4c49b047fc8a9a3d60b41786421899b97436
}.freeze

CENTOS_6 = {
  platform: 'centos',
<<<<<<< HEAD
  version: '6.9',
=======
  version: '6.9'
>>>>>>> d31a4c49b047fc8a9a3d60b41786421899b97436
}.freeze

ALL_PLATFORMS = [
  CENTOS_6,
  CENTOS_7,
].freeze

RSpec.configure do |config|
  config.log_level = :fatal
end
