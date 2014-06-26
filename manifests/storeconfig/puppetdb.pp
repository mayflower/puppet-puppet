# Install the puppetdb terminus. Puppetdb configuration should occur elsewhere.
class puppet::storeconfig::puppetdb(
  $server  = $::puppet::params::puppetdb_server,
  $port    = $::puppet::params::puppetdb_port,
  $version = 'present'
) {
  include puppet::params

  file { "${::puppet::params::puppet_confdir}/puppetdb.conf":
    ensure  => present,
    mode    => 0644,
    owner   => 'puppet',
    group   => 'puppet',
    content => template('puppet/puppetdb.conf.erb'),
    notify => Class['puppet::server'],
  }

  package { 'puppetdb-terminus':
    ensure => $version,
    notify => Class['puppet::server'],
  }
}
