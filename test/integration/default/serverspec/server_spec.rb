require 'serverspec'

set :backend, :exec

describe service('varnishlog') do
  it { should_not be_enabled }
end

describe service('varnishncsa') do
  it { should be_enabled }
  it { should be_running }
end
