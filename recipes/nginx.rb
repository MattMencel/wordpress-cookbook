#
# Cookbook Name:: wordpress
# Recipe:: nginx
#
# Copyright 2009-2010, Opscode, Inc.
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

node.set_unless['php-fpm']['pools'] = []
node.set_unless['nginx']['default_site_enabled'] = false

include_recipe 'chef_nginx'
include_recipe 'php'

package node['php']['mysql']['package'] do
  action :install
end

php_fpm_pool 'wordpress' do
  listen '127.0.0.1:9001'
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  additional_config node['wordpress']['php_options']
  max_spare_servers 5
  start_servers 5
  max_children 65
end

include_recipe 'wordpress::app'

template "#{node['nginx']['dir']}/sites-available/wordpress" do
  source 'nginx.conf.erb'
  variables(
    'docroot' => node['wordpress']['dir'],
    'server_name' => node['wordpress']['server_name'],
    'server_aliases' => node['wordpress']['server_aliases'],
    'server_port' => node['wordpress']['server_port']
  )
  action :create
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'wordpress' do
  enable true
end
