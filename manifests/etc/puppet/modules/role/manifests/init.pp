class role::mongo::test {

  file { "/tmp/ichmachmongo":
    ensure => present,
  }
}
