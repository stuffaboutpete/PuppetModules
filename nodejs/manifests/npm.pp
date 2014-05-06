class nodejs::npm {
	
	package { 'npm':
		ensure  => present,
		require => Class['nodejs']
	}
	
}
