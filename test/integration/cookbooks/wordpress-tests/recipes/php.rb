#
# Cookbook Name:: wordpress-tests
# Recipe:: php
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

# This recipe demonstrates how to get a custom PHP version installed with nginx and ssl for your WordPress install

node.default['php']['package_options'] = '--enablerepo=remi* --enablerepo=remi-php70'

include_recipe 'yum-remi-chef::remi'
include_recipe 'yum-remi-chef::remi-php70'

include_recipe 'wordpress-tests::nginx'

package 'php-mcrypt' do
  action :install
end
