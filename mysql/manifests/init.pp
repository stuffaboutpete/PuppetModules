class mysql ($root_password = undef) {
	
	include apache2
	include php
	include apt::update
	
	package { 'mysql-server':
		ensure  => present,
		notify  => Service['apache2'],
		require => Class['apt::update']
	}
	
	package { 'mysql-client':
		ensure  => present,
		require => Class['apt::update']
	}
	
	package { 'php5-mysql':
		ensure  => present,
		require => [Package['mysql-server'], Class['php']]
	}
	
	service { 'mysql':
		enable  => true,
		ensure  => running,
		require => Package['mysql-server']
	}
	
	if ($root_password) {
		
		exec { "mysqladmin -u root password $root_password":
			unless  => "mysqladmin -u root -p$root_password status",
			require => Package['mysql-server'],
			path    => ['/bin', '/usr/bin']
		}
		
	}
	
}