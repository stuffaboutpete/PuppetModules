class php::extension::pear::memcache {
	
	include apt::update
	include apache2
	include php::extension::pear
	
	package { 'php5-memcache':
		ensure  => present,
		require => Class['apt::update']
	}
	
	package { 'memcached':
		ensure  => present,
		require => [Class['php::extension::pear'], Package['php5-memcache']]
	}
	
	package { 'build-essential': }
	
	exec { 'install memcache':
		command => 'pecl install memcache',
		path    => '/usr/bin',
		require => [Package['memcached'], Package['build-essential']]
	}
	
	file { 'memcache.ini':
		ensure => present,
		path   => '/etc/php5/conf.d/memcache.ini'
	}
	
	exec { 'add memcache.ini entry':
		command => "/bin/echo 'echo \"extension=memcache.so\" >> /etc/php5/conf.d/memcache.ini' | sudo -s",
		require => [Exec['install memcache'], File['memcache.ini']],
		notify  => Service['apache2']
	}
	
}