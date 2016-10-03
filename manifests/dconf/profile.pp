# Class: gnome::dconf::profile
# ===========================
#
# This class sets up the profiles for dconf.
#
# Parameters
# ----------
#
# * `user_database`
# This is the database that the user writes to. This will almost ALWAYS
#  be 'user'.
#
# * `user_database_type`
# This is the database type that the user writes to. This will almost
#  ALWAYS be 'user-db'.
#
# * `additional_databases`
# This is a hash of additional database types and databases. There can be
#  multiple databases for each database type. This needs specified as
#  an array.
#
# Examples
# --------
#
# @example
#    gnome::dconf::profile { 'user':
#      user_database        => 'user',
#      user_database_type   => 'user-db',
#      additional_databases => {
#                                'system-db' => [ 'local', 'site' ],
#                              }
#    }
#
define gnome::dconf::profile(
  $user_database        = 'user',
  $user_database_type   = 'user-db',
  $additional_databases = {},
) {

  validate_string($user_database)
  validate_string($user_database_type)

  $dconf_directory = $::gnome::dconf::dconf_directory

  file{
    "${dconf_directory}/profile/${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('gnome/etc/dconf/profile/profile.erb');
  }

}
