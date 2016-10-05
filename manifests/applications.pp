# Class: gnome::applications
# ===========================
#
# This class makes sure the dconf directories exist.
#
class gnome::applications(
  $additional_shortcuts = $::gnome::additional_shortcuts,
  $apps_to_add          = $::gnome::apps_to_add,
  $apps_to_disable      = $::gnome::apps_to_disable,
  $apps_to_enable       = $::gnome::apps_to_enable,
  $apps_to_remove       = $::gnome::apps_to_remove,
  $manage_applications  = $::gnome::manage_applications,
  $manage_shortcuts     = $::gnome::manage_shortcuts,
  $shortcut_base_dir    = $::gnome::shortcut_base_dir,
  $shortcuts_to_remove  = $::gnome::shortcuts_to_remove,
) {

  file {
    [ $shortcut_base_dir, "${shortcut_base_dir}_disabled_shortcuts" ]:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
  }->
  file {
    '/usr/local/bin/manage_shortcuts.sh':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
  }

notify{"${manage_applications}": }

  if $manage_applications == true {
    package{
      $apps_to_remove:
        ensure => 'absent';
      $apps_to_add:
        ensure => 'installed';
    }
  }

  if $manage_shortcuts == true {
    exec {
      'disable_shortcuts':
        command => '/usr/local/bin/manage_shortcuts.sh -d',
        require => File['/usr/local/bin/manage_shortcuts.sh'];
      'enable_shortcuts':
        command => '/usr/local/bin/manage_shortcuts.sh -e',
        require => File['/usr/local/bin/manage_shortcuts.sh'];
    }
  }

}
