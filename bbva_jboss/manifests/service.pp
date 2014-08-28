class bbva_jboss::service(
  $service_name = 'bbva-eap',
  $admin_sg_name = 'DBDC_M01'
)inherits bbva_jboss{

	if $service_enabled and $ensure == present{
		service{$service_name:
			ensure => running,
			enable => true,
			hasrestart => true,  # Specify that an init script has a `restart...
			hasstatus => true, 
		}		
		->
		exec{"/MIDDLEWARE/uti/scrt/JBOSS/jboss.sh start $admin_sg_name":
      onlyif => "/usr/bin/test $(/bin/ps -ef|grep java |grep /usr/local/pr/jboss/BBVA/SERVERGROUPS/$admin_sg_name|grep -v -c grep) -eq 0",
    		}

	} 
	
	if $service_enabled == false and $ensure == present {
   		 service { $service_name:
      			 enable    => false,
                	 hasrestart => true,
                	 hasstatus => true
                 }
        }

	 if $ensure == absent {
#   		 exec{"/MIDDLEWARE/uti/scrt/JBOSS/jboss.sh stop $admin_sg_name":
#      onlyif => "/usr/bin/test $(/bin/ps -ef|grep java |grep /usr/local/pr/jboss/BBVA/SERVERGROUPS/$admin_sg_name|grep -v -c grep) -gt 0",
#   		 }
#    		->
#   		 exec{"/MIDDLEWARE/uti/scrt/JBOSS/jboss.sh stop all":
#      onlyif => "/usr/bin/test $(/bin/ps -ef|grep java |grep /usr/local/pr/jboss/BBVA/SERVERGROUPS/|grep -v -c grep) -gt 0",
#   		 }

    
  	}

}
