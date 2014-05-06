define php::pear::channel () {
	
	include php::pear
	
	exec { "pear channel-discover ${name}" :
		unless  => "/usr/bin/pear channel-info ${name}",
		require => Class['php::pear'],
		path    => '/usr/bin'
	}
	
}