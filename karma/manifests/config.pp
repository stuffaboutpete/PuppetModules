define karma::config (
	$auto_watch    = true,
	$base_path     = undef,
	$files         = [],
	$exclude_files = [],
	$frameworks    = ['jasmine'],
	$browsers      = ['PhantomJS']
) {
	
	include karma
	
	if 'PhantomJS' in $browsers {
		include browser::phantomjs
	}
	
	file { "/etc/karma/${name}.conf.js":
		ensure  => present,
		content => template('karma/karma.conf.js'),
		require => Class['karma']
	}
	
}
