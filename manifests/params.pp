# Private class: gnome::params
class gnome::params {

  case $::osfamily {
    'Debian': {
      $apps_to_remove    = [
        'gnome-photos',
        'evolution',
        'empathy',
        'rhythmbox',
        'libreoffice-core',
        'libreoffice-common',
        'cups-common',
        'cups-browsed',
        'cups-server-common',
        'avahi-daemon',
        'avahi-autoipd',
        'apport-gtk',
        'modemmanager',
        'notification-daemon',
        'gnome-mines',
        'gnome-weather',
        'gnome-mahjongg',
        'gnome-sudoku',
        'transmission-gtk',
        'aisleriot'
      ]
      $dconf_directory   = '/etc/dconf'
      $dconf_bin         = '/usr/bin/dconf'
      $package           = 'ubuntu-gnome-desktop'
      $shortcut_base_dir = '/usr/share/applications'
    }
    default: {
      fail("Unsupported platform. ${module_name} currently does not support ${::osfamily}.")
    }
  }

}
