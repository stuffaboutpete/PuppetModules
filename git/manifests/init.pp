class git {
	
	include apt::update
	
	package { 'git':
		ensure  => present,
		require => Class['apt::update']
	}
	
}