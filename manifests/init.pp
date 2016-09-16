## The aim of this modules is to remove mcelog package in all Rhel servers.

class rmmce {
$mce_package = mcelog

if $mce_package == 'absent' {
  fail("Package is already absent. Unpin node from node group.")
}

case $::osfamily {
  'Windows':{
    fail("Operating system not supported")
}
  'RedHat':{
package { 'mcelog':
  ensure => 'absent',

}
}
}
}
