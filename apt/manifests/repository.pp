define apt::repository {
	
	exec { 'apt-get-update-for-python':
		command => 'apt-get update',
		path    => '/usr/bin'
	}
	
	package { 'python-software-properties':
		ensure  => present,
		require => Exec['apt-get-update-for-python']
	}
	
	exec { "add-apt-repository ${name} -y":
		path    => '/usr/bin',
		require => Package['python-software-properties']
	}
	
}