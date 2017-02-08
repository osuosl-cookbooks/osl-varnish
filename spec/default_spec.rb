require_relative 'spec_helper'

describe 'osl-varnish::default' do
  ALL_PLATFORMS.each do |p|
    context "#{p[:platform]} #{p[:version]}" do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(p) do |node|
          node.automatic['fqdn'] = 'test.osuosl.org'
          node.set['osl-varnish']['ncsa_directives'] = {
            directive1: 'value1',
            directive2: 'value2'
          }
        end.converge(described_recipe)
      end
      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end
      it do
        expect(chef_run.node['varnish']['version']).to eq(3)
      end
      it do
        expect(chef_run.node['varnish']['log_daemon']).to eq(false)
      end
      it do
        expect(chef_run).to include_recipe('varnish')
      end
      it do
        expect(chef_run).to create_template('/etc/sysconfig/varnishncsa').with(
          source: 'varnishncsa.erb',
          variables: { directives: chef_run.node['osl-varnish']['ncsa_directives'] }
        )
      end
      it do
        expect(chef_run).to render_file('/etc/sysconfig/varnishncsa').with_content(
          '# Generated by Chef for test.osuosl.org
#
# Do not edit this file locally. Changes will be overwritten.
directive1="value1"
directive2="value2"'

        )
      end
      it do
        expect(chef_run).to start_service('varnishncsa').with(
          supports: {
            status: true,
            restart: true
          }
        )
        expect(chef_run).to enable_service('varnishncsa')
      end
      it do
        expect(chef_run).to include_recipe('firewall::varnishadm')
      end
    end
  end
end
