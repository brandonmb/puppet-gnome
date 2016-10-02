# Class: gnome::install
# ===========================
#
# This installs the gnome desktop.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `package`
# Overwrite the default package to install.
#
# Examples
# --------
#
# @example
#    class { 'gnome::install':
#      package => 'gnome',
#    }
#
# Authors
# -------
#
# Author Name <brandonmb@github.com>
#
class gnome::install(
  $package = $::gnome::package,
  ) {

  if $gnome::manage_package {
    package { $package:
      ensure => $gnome::package_ensure,
    }
  }

}
