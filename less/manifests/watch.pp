define less::watch ($main_less_file, $target_css_file, $directory) {
	
	include less
	
	file { '/usr/local/bin/lesswatch':
		ensure  => present,
		source  => "puppet:///modules/less/watch-less-files.sh",
		require => Class['less']
	}
	
	$script = "/usr/local/bin/lesswatch $main_less_file $target_css_file $directory &"
	
	file { "/etc/init/watch-less-${name}.conf":
		ensure  => present,
		content => template('less/upstart.conf'),
		require => File['/usr/local/bin/lesswatch']
	}
	
	service { "watch-less-${name}":
		ensure   => running,
		require  => File["/etc/init/watch-less-${name}.conf"],
		provider => 'upstart'
	}
	
}
