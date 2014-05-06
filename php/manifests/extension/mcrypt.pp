class php::extension::mcrypt {
	
	include apache2
	include apt::update
	
	package { 'php5-mcrypt':
		ensure  => present,
		require => Class['apt::update'],
		notify  => Service['apache2']
	}
	
}