# Class: gnome::dconf::database
# ===========================
#
# This class sets up the database directory structure for
#  each database specified.
#
# Parameters
# ----------
#
# * `database`
# Database name
#
# Examples
# --------
#
# @example
#    gnome::dconf::database { 'local': }
#
define gnome::dconf::database {

  $dconf_directory = $::gnome::dconf::dconf_directory

  file{
    [
      "${dconf_directory}/db/${name}.d",
      "${dconf_directory}/db/${name}.d/locks"
    ]:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
  }

}
