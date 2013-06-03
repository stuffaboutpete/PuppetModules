define apache2::module {
	
	include apache2
	
	exec { "/usr/sbin/a2enmod ${name}":
		require => Package['apache2'],
		notify  => Service['apache2']
	}
	
}