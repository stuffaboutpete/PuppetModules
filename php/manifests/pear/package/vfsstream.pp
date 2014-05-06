class php::pear::package::vfsstream {
	
	php::pear::channel { 'pear.bovigo.org': }
	
	php::pear::package { 'bovigo/vfsStream-beta':
		require => Php::Pear::Channel['pear.bovigo.org']
	}
	
}