class php ($version = '5.4', $show_errors = false) {
	
	include apache2
	include apt::update
	
	package { 'php5':
		ensure  => present,
		notify  => Service['apache2'],
		require => Class['apt::update']
	}
	
	package { 'libapache2-mod-php5':
		ensure  => present,
		require => Package['php5']
	}

	if $show_errors {
		$ini_file = 'php-development'
	} else {
		$ini_file = 'php-production'
	}
	
	file { 'php.ini':
		path    => '/etc/php5/apache2/php.ini',
		ensure  => present,
		source  => "puppet:///modules/php/${ini_file}.ini",
		notify  => Service['apache2'],
		require => Package['libapache2-mod-php5']
	}
	
	if $version == '5.4' {
		
		apt::repository { 'ppa:ondrej/php5':
			require => Package['php5']
		}
		
		exec { 'reupdate apt':
			command => 'apt-get update',
			path    => '/usr/bin',
			require => Apt::Repository['ppa:ondrej/php5']
		}
		
		exec { 'reinstall php5.4':
			command => 'apt-get install php5 -y --force-yes',
			path    => '/usr/bin',
			require => Exec['reupdate apt'],
			before  => File['php.ini']
		}
		
	}
	
}