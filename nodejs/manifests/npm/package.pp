define nodejs::npm::package {
	
	include nodejs::npm
	
	exec { "npm install -g ${name}":
		require => Class['nodejs::npm'],
		path    => $::path
	}
	
}
