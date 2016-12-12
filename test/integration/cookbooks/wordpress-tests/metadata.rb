name             'wordpress-tests'
maintainer       'Antek S. Baranski'
maintainer_email 'antek.baranski@gmail.com'
license          'Apache 2.0'
description      'wordpress cookbook test harness'
version          '1.0.0'

%w(debian ubuntu windows centos redhat scientific oracle).each do |os|
  supports os
end

depends 'wordpress'
depends 'yum-remi-chef'
