require 'serverspec'

set :backend, :exec

describe service('varnishlog') do
  it { should_not be_enabled }
end

describe service('varnishncsa') do
  it { should be_enabled }
  it { should be_running }
end

%w(6081 6082).each do |p|
  describe port(p) do
    it { should be_listening }
  end
end

describe file('/etc/sysconfig/varnishncsa') do
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
