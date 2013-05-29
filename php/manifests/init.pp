class php ($version = '5.4') {
	
	include apache2
	
	if $version == '5.4' {
		
		apt::repository { 'ppa:ondrej/php5': }
		
	}
	
	package { 'php5':
		ensure  => present,
		notify  => Service['apache2'],
		require => Class['apt::update']
	}
	
}