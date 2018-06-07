class mysqltest {
  class { '::mysql::server':
    root_password    => 'test_password',
    override_options => {
      'mysqld' => {
        'max_connections' => '1024',
       }
    }
    Service { 'mysqld':
      ensure => running,
    }
    mysql::db { 'testdb':
      user     => 'mano',
      password => 'mano',
      host     => 'server.mysql.com',
    }
    
    mysql_user { 'mano@localhost':
      ensure                   => 'present',
      max_connections_per_hour => '60',
    }
    
    mysql_grant { 'mano@localhost/testdb':
      ensure => 'present',
      options => ['GRANT'],
      priviliges => ['ALL'],
      table => 'newtable',
      user  => 'mano@localhost',
    }
}
