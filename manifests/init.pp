node default {
  class { 'postgresql::server':
    listen_addresses => '*',
  } 

  postgresql::server::database { 'ICAT':
    owner     => 'irods',
    encoding => $postgresql::server::encoding,
    template => 'template0',
    locale   => $postgresql::server::locale,
    istemplate => false,
    require    => [Class['postgresql::server'],Postgresql::Server::Role['irods']],
  } 
  postgresql::server::role { 'myirods':
    db            => 'ICAT',
    login         => true,
    superuser     => true, 
    createdb      => true,
    password_hash => postgresql_password('myirods', 'password'),
  }   
  postgresql::server::role { 'irods':
    login         => true,
    createdb      => true,
    superuser     => true,
    password_hash => postgresql_password('irods', 'password'),
  }
#  postgresql::server::database_grant { "GRANT irods - ALL - ICAT":
#    privilege => 'ALL',
#    db        => 'ICAT',
#    role      => 'irods',
#  } -> Postgresql::Validate_db_connection<| database_name == 'ICAT' |>


}
