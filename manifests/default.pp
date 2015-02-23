node default {
  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.3',
  } ->
  class { 'postgresql::server':
    listen_addresses => '*',
  } ->
  postgresql::server::db { 'my_application_database':
    user     => 'postgresql',
    password => postgresql_password('postgresql', 'password'),
    require  => Class['postgresql::server'],
  }

  postgresql::server::pg_hba_rule { 'allow access from localhost':
    description => "allow access from 10.20.1.3",
    type => 'host',
    database => 'all',
    user => 'all',
    address => '10.20.1.3/32',
    auth_method => 'md5',
    order       => '002',
  }
}

