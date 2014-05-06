class less {
	
	include apt::update
	
	package { 'node-less':
		ensure  => present,
		require => Class['apt::update']
	}
	
}