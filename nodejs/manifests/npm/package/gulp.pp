class nodejs::npm::package::gulp {
	
	include nodejs::npm
	
	exec { 'install-gulp-global':
		command => 'npm install gulp --global',
		path    => $::path,
		require => Class['nodejs::npm']
	}
	
}
