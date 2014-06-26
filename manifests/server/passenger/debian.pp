# Class: puppet::server::passenger::debian
#
# This class installs and configures Passenger for Puppet on Debian
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class puppet::server::passenger::debian ($ensure='present'){
  package { 'puppetmaster-passenger':
    ensure  => $ensure,
    require => Apt::Source['puppetlabs']
  }

  # workaround an issue in puppet::server
  # where the puppetmaster package is installed
  # for all server types
  service { 'puppetmaster': ensure => stopped, enable => false }
}
