class nodejs {
	
	include apt::update
	
	package { 'nodejs':
		ensure  => present,
		require => Class['apt::update']
	}
	
	file { '/usr/bin/node':
		ensure  => 'link',
		target  => '/usr/bin/nodejs',
		require => Package['nodejs']
	}
	
}
