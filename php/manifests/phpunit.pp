class php::phpunit {
	
	include apt::update
	
	package { 'phpunit':
		ensure  => present,
		require => Class['apt::update']
	}
	
}
