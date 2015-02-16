# == Class site_hadoop
#
# Basic system configurations for Hadoop cluster on Meta.
#
# ##Parameters
#
# ####`email` undef
#
# Email address to send errors from cron.
#
# ####`mirror` 'cloudera'
#
# Cloudera mirror to use.
#
# Values:
#
# * **cloudera**
# * **scientific**
#
# ####`scripts_enable` true
#
# Create also helper useful scripts in /usr/local.
#
#
class site_hadoop (
  $email = undef,
  $mirror = $site_hadoop::params::mirror,
  $scripts_enable = $site_hadoop::params::scripts_enable,
) inherits site_hadoop::params {
  include 'site_hadoop::install'
  include 'site_hadoop::config'
  include 'site_hadoop::cloudera'

  Class['site_hadoop::cloudera'] ->
  Class['site_hadoop::install'] ->
  Class['site_hadoop::config'] ->
  Class['site_hadoop']
}
