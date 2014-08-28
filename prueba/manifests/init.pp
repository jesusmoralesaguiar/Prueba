class prueba (
    $ensure = 'present',
) {
    file { 'test':
        ensure => $ensure,
        source => 'puppet:///modules/prueba/test.txt',
        path => '/opt/test2.txt',
    }
}
