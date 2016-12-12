# Description

Installs/Configures WordPress LAMP stack on Linux & Windows

# Requirements

## Platform:

* centos
* ubuntu
* debian
* windows
* redhat
* scientific
* oracle

## Cookbooks:

* php
* openssl
* apache2 (>= 2.0.0)
* database (>= 1.6.0)
* mysql (< 7.0)
* mysql2_chef_gem (~> 1.0.1)
* iis (>= 1.6.2)
* tar (>= 0.3.1)
* chef_nginx (~> 5.1)
* selinux (~> 0.7)

# Attributes

* `node['wordpress']['version']` -  Defaults to `latest`.
* `node['wordpress']['creds']['databag']` -  Defaults to `nil # You must provide your own databag with 2 encrypted passwords in it.`.
* `node['wordpress']['db']['instance_name']` -  Defaults to `default`.
* `node['wordpress']['db']['user']` -  Defaults to `wordpressuser`.
* `node['wordpress']['db']['prefix']` -  Defaults to `wp_`.
* `node['wordpress']['db']['hosts']` -  Defaults to `%w(localhost)`.
* `node['wordpress']['db']['port']` -  Defaults to `3306' # Must be a string`.
* `node['wordpress']['db']['charset']` -  Defaults to `utf8`.
* `node['wordpress']['db']['collate']` -  Defaults to ``.
* `node['wordpress']['db']['mysql_version']` -  Defaults to `case node['platform']`.
* `node['wordpress']['allow_multisite']` -  Defaults to `false`.
* `node['wordpress']['ssl_enabled']` -  Defaults to `false`.
* `node['wordpress']['production']` -  Defaults to `true # This attribute controls PHP debug data output, here be Dragons in production.`.
* `node['wordpress']['wp_config_options']` -  Defaults to `{ ... }`.
* `node['wordpress']['config_perms']` -  Defaults to `0644`.
* `node['wordpress']['server_aliases']` -  Defaults to `[ ... ]`.
* `node['wordpress']['server_port']` -  Defaults to `80`.
* `node['wordpress']['install']['user']` -  Defaults to `node['apache']['user']`.
* `node['wordpress']['install']['group']` -  Defaults to `node['apache']['group']`.
* `node['wordpress']['languages']['lang']` -  Defaults to ``.
* `node['wordpress']['languages']['version']` -  Defaults to ``.
* `node['wordpress']['languages']['repourl']` -  Defaults to `http://translate.wordpress.org/projects/wp`.
* `node['wordpress']['languages']['projects']` -  Defaults to `%w(main admin admin_network continents_cities)`.
* `node['wordpress']['languages']['themes']` -  Defaults to `[ ... ]`.
* `node['wordpress']['languages']['project_pathes']` -  Defaults to `{ ... }`.
* `node['wordpress']['languages']['project_pathes']["twenty#{year}"]` -  Defaults to `/twenty#{year}/`.
* `node['wordpress']['languages']['urls'][project]` -  Defaults to `node['wordpress']['languages']['repourl'] + '/' +`.
* `node['wordpress']['parent_dir']` -  Defaults to `/var/www`.
* `node['wordpress']['dir']` -  Defaults to `#{node['wordpress']['parent_dir']}/wordpress`.
* `node['wordpress']['url']` -  Defaults to `https://wordpress.org/wordpress-#{node['wordpress']['version']}.tar.gz`.
* `node['wordpress']['server_name']` -  Defaults to `node['fqdn']`.
* `node['wordpress']['php_options']` -  Defaults to `{ ... }`.
* `node['php']['ini']['cookbook']` -  Defaults to `wordpress`.
* `node['php']['fpm_user']` -  Defaults to `node['apache']['user']`.
* `node['php']['fpm_group']` -  Defaults to `node['apache']['group']`.
* `node['php']['fpm_listen_user']` -  Defaults to `node['apache']['user']`.
* `node['php']['fpm_listen_group']` -  Defaults to `node['apache']['group']`.

# Recipes

* wordpress::default - Installs and configures WordPress LAMP stack on a single system
* wordpress::database - Installs the MySQL database for WordPress on a node
* wordpress::apache - Installs the WordPress LAP stack on a node, depends on wordpress::database to be run on a different node
* wordpress::nginx - Installs the WordPress Nginx stack on a node, depends on wordpress::database to be run on a different node
* wordpress::app - Configres a WordPress instances on a node
* wordpress::languages - Install WordPress translation files

# License and Maintainer

Maintainer:: Brint O'Hearn (<cookbooks@opscode.com>)
Source:: https://github.com/brint/wordpress-cookbook
Issues:: https://github.com/brint/wordpress-cookbook/issues

License:: Apache v2.0
