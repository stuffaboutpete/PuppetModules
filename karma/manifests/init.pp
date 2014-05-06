class karma {
	
	include nodejs
	
	nodejs::npm::package { 'karma': }
	
	file { '/etc/karma':
		ensure => directory
	}
	
}
