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
  $dconf_bin       = $::gnome::params::dconf_bin,
  $dconf_directory = $::gnome::params::dconf_directory,
  $manage_package  = $::gnome::params::manage_package,
  $package         = $::gnome::params::package,
  $package_ensure  = $::gnome::params::package_ensure,
  ) inherits gnome::params {

  include '::gnome::install'
  include '::gnome::dconf'

}
