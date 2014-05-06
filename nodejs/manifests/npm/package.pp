define nodejs::npm::package {
	
	class { 'nodejs::npm': }
	
	exec { "npm install -g ${name}":
		require => Class['nodejs::npm'],
		path    => $::path
	}
	
}
