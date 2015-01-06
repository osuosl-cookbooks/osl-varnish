#
# Cookbook Name:: osl-varnish
# Recipe:: default
#
# Copyright 2014, Oregon State University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Default to 3
node.default['varnish']['version'] = 3.0

# Disable varnishlog daemon to conserve disk space.
node.default['varnish']['log_daemon'] = false

include_recipe 'varnish'

# Enable varnishncsa instead.
service 'varnishncsa' do
  supports status: true, restart: true
  action node['osl-varnish']['ncsa_daemon'] ? %w(enable start) : \
    %w(disable stop)
end
