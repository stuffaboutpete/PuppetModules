define php::pear::package {
	
	include php::pear
	
	exec { "pear install ${name}":
		unless  => "pear info ${name}",
		require => Class['php::pear'],
		path    => '/usr/bin'
	}
	
}