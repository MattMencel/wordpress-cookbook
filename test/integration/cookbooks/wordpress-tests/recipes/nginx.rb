#
# Cookbook Name:: wordpress-tests
# Recipe:: nginx
#
# Copyright 2017, Antek S. Baranski <antek.baranski@gmail.com>
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

# This recipe demonstrates how to get nginx with ssl for your WordPress install

node.default['wordpress']['install']['user'] = node['nginx']['user']
node.default['wordpress']['install']['group'] = node['nginx']['group']

node.default['wordpress-tests']['ssl_cert'] = 'ssl.crt'
node.default['wordpress-tests']['ssl_cert_key'] = 'ssl.key'

cookbook_file '/etc/pki/tls/certs/ssl.crt' do
  source node['wordpress-tests']['ssl_cert']
end

cookbook_file '/etc/pki/tls/private/ssl.key' do
  source node['wordpress-tests']['ssl_cert_key']
end

cookbook_file '/etc/ssl/certs/dhparam.pem' do
  source 'dhparam.pem'
end

include_recipe 'wordpress::database'
include_recipe 'wordpress::nginx'

resources("template[#{node['nginx']['dir']}/sites-available/wordpress]").cookbook 'wordpress-tests'
