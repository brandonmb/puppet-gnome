# puppet-gnome

#### Table of Contents
1. [Module Description - What the module does](#module-description)
2. [Usage - Configuration options](#usage)
3. [Reference - Information about how the module works](#reference)
4. [Limitations - What this works with](#limitations)


## Module Description

After much digging I could not find a puppet module which controlled the actual configuration files for gnome or dconf. This module is intended to control those files, and not run tons of execs for everything. I have only been testing with ubuntu-gnome-desktop, so experience may vary.


## Usage

There are many ways to interact with this module. Currently the 4 main classes to use are `gnome::applications`, `gnome::dconf::profiles`, `gnome::dconf::settings`, and `gnome::dconf::locks`.

### How to use gnome::application

### How to use gone::dconf::profiles

### How to use gnome::dconf::settings

### How to use gnome::dconf::locks


## Reference

### gnome::application

This class controls the applications that a user sees on their desktop and in the "Activities" panel.

WARNING: Removing files without understanding their exact purpose is VERY dangerous.

CRITICAL WARNING: Removing all files from /usr/share/applications will most likely keep your desktop from coming up. Because of this if someone uses the purge option for this class, it does automatically back all of the files up and put them in /usr/share/applications_bak.tar.gz. IF you run purge and end up with a command prompt and no GUI, remove purge, restore the files from the tar archive, and restart your desktop/server. This should get your desktop back, but no guarantees!

### gnome::dconf::profiles

Profiles are used to control where users read and write their settings to and from. A profile contains a hierarchical list of databases. The first database is always the "user" database. This database exists inside the user's home directory under .config/dconf/. The `gnome::dconf::profiles` class allows the creation of many profiles, though you will likely only ever setup a "user" profile.

### gnome::dconf::settings

Gnome uses dconf for the configuration of various settings. You can view these setting by either using "dconf-editor" or "gsettings". The dconf-editor command will open a GUI. Gsettings is command line based.

This module creates key files to control the gnome settings. The keyfiles go inside a database. The database is created with the command "dconf update." File are put within a database directory to tell "dconf update" what to put into the database file. The database with a name of "test" will have the file structure of "/etc/dconf/db/test.d" and the database file itself will be "/etc/dconf/db/test."

Additional informaton about dconf settings can be found in gnome's official documentation:
https://help.gnome.org/admin/system-admin-guide/stable/dconf-custom-default-values.html.en

### gnome::dconf::locks

The locking down of dconf keys (user settings) is being controlled via lock files. These lock files are created in a "locks" directory within the database directory of /etc/dconf.

For reference see gnome's official documentation:
https://help.gnome.org/admin/system-admin-guide/stable/dconf-lockdown.html.en


## Limitations

This has only been tested with Ubuntu 16.04 and with the ubuntu-gnome-desktop package. If this works with another release PLEASE update the documentation and create a pull request.
