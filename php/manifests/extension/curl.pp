class php::extension::curl {
	
	include apache2
	include apt::update
	
	package { 'curl':
		ensure  => present,
		require => Class['apt::update']
	}
	
	package { 'php5-curl':
		ensure  => present,
		require => Package['curl'],
		notify  => Service['apache2']
	}
	
}