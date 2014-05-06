class php::extension::cli {
	
	include apache2
	include apt::update
	
	package { 'php5-cli':
		ensure  => present,
		require => Class['apt::update'],
		notify  => Service['apache2']
	}
	
}