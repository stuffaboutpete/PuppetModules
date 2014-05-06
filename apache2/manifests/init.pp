class apache2 {
	
	package { 'apache2':
		ensure => present
	}
	
	service { 'apache2':
		enable  => true,
		ensure  => running,
		require => Package['apache2']
	}
	
	exec { '/usr/sbin/a2dissite 000-default':
		require => Package['apache2'],
		notify  => Service['apache2']
	}
	
	file { '/var/www/index.html':
		ensure  => absent,
		require => Package['apache2']
	}
	
}