define mysql::database (
	$schema = undef,
	$data   = undef
) {
	
	exec { "create-database ${name}":
		unless  => "mysql -u root -p${mysql::root_password} ${name}",
		command => "mysql -u root -p${mysql::root_password} -e 'CREATE DATABASE ${name}'",
		require => Class['mysql'],
		path    => '/usr/bin'
	}
	
	if $schema {
		
		exec { 'apply-schema':
			onlyif  => "mysql -u root -p${mysql::root_password} ${name}",
			command => "mysql -u root -p${mysql::root_password} ${name} < ${schema}",
			require => Exec["create-database ${name}"],
			path    => '/usr/bin'
		}
		
		if $data {
			
			exec { 'apply-data':
				onlyif  => "mysql -u root -p${mysql::root_password} ${name}",
				command => "mysql -u root -p${mysql::root_password} ${name} < ${data}",
				require => Exec['apply-schema'],
				path    => '/usr/bin'
			}
			
		}
		
	}
	
}