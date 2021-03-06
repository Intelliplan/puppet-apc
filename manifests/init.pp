/*

== Class: apc

Installs APC Support with basic configuration.
Depends on (tested with)
 - https://github.com/camptocamp/puppet-apache.git
 - https://github.com/camptocamp/puppet-php.git

Example usage:

  include apc

  with parameter overrides:

  class{'::apc':
    param => 'value',
  }

Configuration:

  - edit params.pp to change default values
  - add new values to augeas-command in config.pp

*/

class apc (
  $pkg                   = $::apc::params::pkg,
  $conf                  = $::apc::params::conf,
  $enabled               = $::apc::params::enabled,
  $shmsize               = $::apc::params::shmsize,
  $shmsegments           = $::apc::params::shmsegments,
  $ttl                   = $::apc::params::ttl,
  $stat                  = $::apc::params::stat,
  $canonicalize          = $::apc::params::canonicalize,
  $include_once_override = $::apc::params::include_once_override,
  $rfc1867               = $::apc::params::rfc1867,
  $mmap_file_mask        = $::apc::params::mmap_file_mask,
  $enable_cli            = $::apc::params::enable_cli,
) inherits ::apc::params {

  case $operatingsystem {
    Debian,Ubuntu,CentOS:  { include ::apc::config }
    default:               { fail "Unsupported operatingsystem: ${operatingsystem}" }
  } 

}
