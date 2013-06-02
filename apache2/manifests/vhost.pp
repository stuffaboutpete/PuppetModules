define apache2::vhost ($docroot) {
	
	include apache2
	
	file { "/etc/apache2/sites-available/${name}":
		ensure  => present,
		content => template('apache2/vhost.conf'),
		require => Package['apache2']
	}
	
	file { "${docroot}/index.php":
		ensure => present,
		before => File["/etc/apache2/sites-available/${name}"]
	}
	
	exec { "/usr/sbin/a2ensite ${name}":
		require => [
			File["/etc/apache2/sites-available/${name}"],
			Package['apache2']
		],
		notify  => Service['apache2']
	}
	
}