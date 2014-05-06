define apache2::vhost::host ($server) {
	
	exec { "${server}${name}":
		command => "/bin/echo 'echo \"127.0.0.1	${server}${name}\" >> /etc/hosts' | sudo -s"
	}
	
}