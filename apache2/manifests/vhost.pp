define apache2::vhost ($docroot, $environment = 'production', $aliases = undef) {
	
	include apache2
	
	file { "/etc/apache2/sites-available/${name}.conf":
		ensure  => present,
		content => template('apache2/vhost.conf'),
		require => Package['apache2']
	}
	
	file { "${docroot}/index.php":
		ensure => present,
		before => File["/etc/apache2/sites-available/${name}.conf"]
	}
	
	exec { "/usr/sbin/a2ensite ${name}":
		require => [
			File["/etc/apache2/sites-available/${name}.conf"],
			Package['apache2']
		],
		notify  => Service['apache2']
	}
	
	exec { "/bin/echo 'echo \"127.0.0.1	${name}\" >> /etc/hosts' | sudo -s":
		unless => "/bin/grep -q \"127.0.0.1 ${name}\" /etc/hosts | wc -l"
	}
	
	if $aliases {
		apache2::vhost::host { $aliases:
			server => $name
		}
	}
	
}