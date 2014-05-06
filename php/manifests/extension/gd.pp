class php::extension::gd {
	
	include apache2
	include apt::update
	
	package { 'php5-gd':
		ensure  => present,
		require => Class['apt::update'],
		notify  => Service['apache2']
	}
	
}