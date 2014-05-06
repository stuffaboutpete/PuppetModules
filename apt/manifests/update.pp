class apt::update {
	
	exec { 'apt-get update':
		path => '/usr/bin'
	}
	
}