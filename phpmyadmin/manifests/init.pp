class phpmyadmin ($domain) {
	
	include apache2
	
	package { 'phpmyadmin':
		ensure => present
	}
	
	apache2::vhost { $domain:
		docroot => '/usr/share/phpmyadmin',
		require => [
			Package['phpmyadmin'],
			Package['apache2']
		]
	}
	
}