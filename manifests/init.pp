# Class: gnome
# ===========================
#
# This class is the base class for the gnome module.
# The only purpose it serves is to install the gnome desktop and
# to make sure some needed directories exist.
#
# Parameters
# ----------
#
# * `manage_package`
# Whether or not we manage the gnome package. The default is false.
#
# * `package_ensure`
# Whether to install or remove the package.
#
# Examples
# --------
#
# @example
#    class { 'gnome':
#      manage_package => true,
#    }
#
# Authors
# -------
#
# Brandon <brandonmb@github.com>
#
# Copyright
# ---------
#
# Copyright 2016 brandonmb, unless otherwise noted.
#
class gnome(
  $additional_shortcuts = {},
  $apps_to_add          = [],
  $apps_to_disable      = '',
  $apps_to_enable       = '',
  $apps_to_remove       = $::gnome::params::apps_to_remove,
  $dconf_bin            = $::gnome::params::dconf_bin,
  $dconf_directory      = $::gnome::params::dconf_directory,
  $manage_applications  = false,
  $manage_shortcuts     = false,
  $manage_package       = false,
  $package              = $::gnome::params::package,
  $package_ensure       = present,
  $shortcut_base_dir    = $::gnome::params::shortcut_base_dir,
  $shortcuts_to_remove  = [],
  ) inherits gnome::params {

  include '::gnome::applications'
  include '::gnome::install'
  include '::gnome::dconf'

}
