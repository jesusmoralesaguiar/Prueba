define entornos::ctf(
    $environment,
    $ensure,
    $source,
    $name,
#    $path
){
	
	
    file { "CTF":
        ensure =>'present',
        path => "/opt/$name",
        source => $source,
	
    }
}

