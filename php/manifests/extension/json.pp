class php::extension::json {
	
	include apache2
	include apt::update
	
	package { 'php5-json':
		ensure  => present,
		require => Class['apt::update'],
		notify  => Service['apache2']
	}
	
}