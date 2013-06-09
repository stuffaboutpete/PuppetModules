class git {
	
	package { 'git':
		ensure => present
	}
	
	exec { 'pretty-logger':
		command => 'git config --global alias.prettylog "log --color --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit"',
		path    => '/usr/bin',
		require => Package['git']
	}
	
}