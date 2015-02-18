node default {
  class { 'postgresql::server': }

  postgresql::server::db { 'ICAT':
    user => 'my_irods',
    password => postgresql_password('my_irods', 'mypassword'),
  }

  postgresql::server::role { 'irods':
    password_hash => postgresql_password('irods', 'irods'),
  }

  postgresql::server::role { 'machine1':
    db            => 'ICAT',
    superuser     => true,
    login         => true,
    createdb      => true,
    password_hash => postgresql_password('machine1', 'irods'),
  }

  postgresql::server::database_grant { 'ICAT':
    privilege => 'ALL',
    db        => 'ICAT',
    role      => 'irods',
  }

  postgresql::server::database_grant { 'machine1@ICAT':
    privilege => 'ALL',
    db        => 'ICAT',
    role      => 'machine1',
  }
}
