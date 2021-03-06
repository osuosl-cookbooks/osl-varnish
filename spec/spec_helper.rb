require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'osl-varnish' }

CENTOS_7 = {
  platform: 'centos',
  version: '7.4.1708',
}.freeze

CENTOS_6 = {
  platform: 'centos',
  version: '6.9',
}.freeze

ALL_PLATFORMS = [
  CENTOS_6,
  CENTOS_7,
].freeze

RSpec.configure do |config|
  config.log_level = :fatal
end
