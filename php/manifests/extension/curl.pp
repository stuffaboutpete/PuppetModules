class php::extension::curl {
	
	include apache2
	
	package { 'curl':
		ensure => present
	}
	
	package { 'php5-curl':
		ensure  => present,
		require => Package['curl'],
		notify  => Service['apache2']
	}
	
}