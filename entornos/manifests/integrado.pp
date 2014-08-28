define entornos::integrado(
    $environment,
    $ensure,
    $source,
    $name,
#    $path
){
	
    file { "Integrado":
        ensure =>'present',
        path => "/opt/$name", #Importante poner doble comilla para qno copie literal
        source => $source,
		
    }
}

