class browser::phantomjs {
	
	include apt::update
	
	package { 'phantomjs':
		ensure  => present,
		require => Class['apt::update']
	}
	
}
