class php::extension::pear {
	
	include apt::update
	
	package { 'php-pear':
		ensure  => present,
		require => Class['apt::update']
	}
	
}