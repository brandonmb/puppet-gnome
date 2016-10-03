# Class: gnome::dconf::lock
# ===========================
#
# This class creates dconf locks for various settings.
#
# Parameters
# ----------
#
# * `database`
# The database that these locks will go into. Required.
#
# * `locks`
# An array of locks that will be set. Required.
#
# * `priority`
# This sets the priority of the key. This can generally by left as default.
#
# Examples
# --------
#
# @example
#    gnome::dconf::lock { 'background':
#      database => 'local',
#      priority => '01',
#      locks=> [
#        '/org/gnome/desktop/background/picture-uri',
#      ]
#    }
#
# Authors
# -------
#
# Author Name brandonmb
#
define gnome::dconf::lock(
  $database,
  $locks,
  $dconf_bin = $::gnome::dconf_bin,
  $priority  = '00',
  ) {

  validate_array($locks)
  validate_integer($priority)
  validate_string($database)

  $dconf_directory = $::gnome::dconf::dconf_directory

  file {
    "${dconf_directory}/db/${database}.d/locks/${priority}_${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('gnome/etc/dconf/db/lock_file.erb'),
      require => File["${dconf_directory}/db/${database}.d/locks"],
      notify  => Exec["update_${name}"];
  }


  exec {
    "update_${name}":
      command     => "${dconf_bin} update",
      refreshonly => true;
  }

}
