class php::extension::xdebug {
	
	include apache2
	include apt::update
	
	package { 'php5-xdebug':
		ensure  => present,
		notify  => Service['apache2'],
		require => Class['apt::update'],
		before  => Exec['reinstall php5.4']
	}
	
	file { 'xdebug.ini':
		path    => '/etc/php5/apache2/conf.d/xdebug.ini',
		ensure  => present,
		source  => "puppet:///modules/php/xdebug.ini",
		notify  => Service['apache2'],
		require => Package['php5-xdebug']
	}
	
}