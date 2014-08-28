class bbva_deployments::server_group(
#    $ensure='present',
    $environment,
){
    $server_name="Servidor"

    case $environment{ 

  	"Desarrollo":{
			 entornos::desarrollo { $server_name:

      			 # enviroment =>$enviroment,
       			 environment => "Desarrollo",
       			 ensure => 'present',
       			 source => "puppet:///modules/bbva_deployments/texto.txt",
			 name=>"Deployment_Developer.txt",			 
   			 }
	}

       "Integrado":{
		   	 entornos::integrado { $server_name:

       			 environment =>"Integrado",
       			 ensure => 'present',
       			 source => "puppet:///modules/bbva_deployments/texto.txt",
			 name=>"Deployment_Integer.txt",
   			 }
	}

	"CTF":{

		   	 entornos::ctf { $server_name:

        		 environment =>"CTF",
       			 ensure => 'present',
       			 source => "puppet:///modules/bbva_deployments/texto.txt",
			 name=>"CTF.txt",
    			 }
	}

    }
}







