# Class: gnome::dconf::setting
# ===========================
#
# This class is the base class for the gnome module.
# The only purpose it serves is to install the gnome desktop.
#
# Parameters
# ----------
#
# * `database`
# The database that these keys will go into. Required.
#
# * `section`
# The section that these keys are for. Required.
#
# * `settings`
# The settings for the keys. Required.
#
# * `create_locks`
# This locks the setting so the user cannot override it.
#  This is true by default since usually if you are creating
#  a system wide setting, you don't want it overridden.
#
# * `priority`
# This sets the priority of the key. This can generally by left as default.
#
# Examples
# --------
#
# @example
#    gnome::dconf::setting { 'background':
#      database => 'local',
#      priority => '01',
#      section  => 'org/gnome/desktop/background',
#      settings => {
#        'picture-uri' => 'file:///usr/share/backgrounds/gnome/example.jpg',
#      }
#    }
#
# Authors
# -------
#
# Author Name brandonmb
#
define gnome::dconf::setting(
  $database,
  $section,
  $settings,
  $create_locks = true,
  $priority     = 00,
  ) {

  validate_bool($create_locks)
  validate_hash($settings)
  validate_integer($priority)
  validate_string($database)
  validate_string($section)

  $dconf_directory = $::gnome::dconf::dconf_directory

  file {
    "${dconf_directory}/db/${database}.d/${priority}_${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('gnome/etc/dconf/db/key_file.erb');
  }

  if $create_locks {

    $locks = keys($settings) # puts keys into an array
    $full_locks = prefix($locks, $section)

    gnome::dconf::lock { $name:
      database => $database,
      priority => $priority,
      locks    => $full_locks,
    }
  }

}
