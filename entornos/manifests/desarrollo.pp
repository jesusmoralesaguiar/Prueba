define entornos::desarrollo(
    $environment,
    $ensure,
    $source,
    $name,
#    $path  =>Lo ejecutamos directamente enel file
){
	
    file {["/opt/beeva","/opt/beeva/Desarrollo"]:
        ensure =>"directory",    
        owner => "root", 
    }
	
    file {["/opt/beeva/Desarrollo/$name"]:

	require=> File["/opt/beeva/Desarrollo"],
#	ensure=>"absent", #Remove the file y deja un backup
	ensure=> "present",
	source => $source,
	backup=>".backup",   #Para que con cuando actualze los archivos me guarde un backup

    }


# file { "Desarrollo":
#        ensure =>'present',
#        path => "/opt/$name",
#        source => $source,

#    }
}
