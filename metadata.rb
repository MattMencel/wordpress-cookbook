name             'wordpress'
maintainer       "Brint O'Hearn"
maintainer_email 'cookbooks@opscode.com'
license          'Apache v2.0'
description      'Installs/Configures WordPress LAMP stack on Linux & Windows'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '4.0.0'

recipe 'wordpress::default', 'Installs and configures WordPress LAMP stack on a single system'
recipe 'wordpress::database', 'Installs the MySQL database for WordPress on a node'
recipe 'wordpress::apache', 'Installs the WordPress LAP stack on a node, depends on wordpress::database to be run on a different node'
recipe 'wordpress::nginx', 'Installs the WordPress Nginx stack on a node, depends on wordpress::database to be run on a different node'
recipe 'wordpress::app', 'Configres a WordPress instances on a node'
recipe 'wordpress::languages', 'Install WordPress translation files'

issues_url 'https://github.com/brint/wordpress-cookbook/issues'
source_url 'https://github.com/brint/wordpress-cookbook'

supports 'centos'
supports 'ubuntu'

chef_version '>= 12.7'

depends 'php'
depends 'openssl'
depends 'apache2', '>= 2.0.0'
depends 'database', '>= 1.6.0'
depends 'mysql', '< 7.0'
depends 'mysql2_chef_gem', '~> 1.0.1'
depends 'iis', '>= 1.6.2'
depends 'tar', '>= 0.3.1'
depends 'chef_nginx', '~> 5.1'
depends 'selinux'

%w(debian ubuntu windows centos redhat scientific oracle).each do |os|
  supports os
end
