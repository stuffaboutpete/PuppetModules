class php::extension::soap {
	
	include apache2
	include apt::update
	
	package { 'php5-soap':
		ensure  => present,
		require => Class['apt::update'],
		notify  => Service['apache2']
	}
	
}