# Class: gnome::dconf
# ===========================
#
# This class makes sure the dconf directories exist.
#
class gnome::dconf(
  $dconf_directory = $::gnome::dconf_directory,
) {

  file {
    [
      $dconf_directory,
      "${dconf_directory}/db",
      "${dconf_directory}/profile"
    ]:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
  }

}
