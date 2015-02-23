node default {
  class { 'postgresql::globals':
    #manage_package_repo => true,
    #version             => '9.3',
  } ->
  class { 'postgresql::server':
    listen_addresses => '*',
  } ->
  postgresql::server::db { 'ICAT':
    user     => 'irods',
    password => postgresql_password('irods', 'password'),
    require  => Class['postgresql::server'],
  } -> 
  postgresql::server::role { 'myirods':
    db => 'ICAT',
    login => true,
    superuser => true, 
  } 

}

