# Private class: gnome::params
class gnome::params {

  $manage_package = false
  $package_ensure = present

  case $::osfamily {
    'Debian': {
      $dconf_directory = '/etc/dconf'
      $dconf_bin       = '/usr/bin/dconf'
      $package         = 'ubuntu-gnome-desktop'
    }
    default: {
      fail("Unsupported platform. ${module_name} currently does not support ${::osfamily}.")
    }
  }

}
