class php::extension::xdebug {
	
	include apache2
	
	package { 'php5-xdebug':
		ensure => present,
		notify => Service['apache2']
	}
	
	file { 'xdebug.ini':
		path    => '/etc/php5/apache2/conf.d/xdebug.ini',
		ensure  => present,
		source  => "puppet:///modules/php/xdebug.ini",
		notify  => Service['apache2'],
		require => Package['php5-xdebug']
	}
	
}