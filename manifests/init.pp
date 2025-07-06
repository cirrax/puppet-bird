# @summary the main bird class
#
# @param config_file
#   the main config file
# @param config_dir
#   directory where we put all additional
#   files
# @param config_owner
#   owner of config files
# @param config_group
#   group of config files
# @param config_mode
#   mode of config files
# @param config_dir_mode
#   mode of the $config_dir
# @param packages
#   Array of packages to manage
# @param package_ensure
#   ensure parameter for packages
# @param generic_configs
#   config files to create with
#   the define bird::generic
#   Remark: this parameter is hash merged
# @param incl_protocols
#   list of protocols to include (in a simple
#   configuration. Includes the classes
#   bird::protocols::____
#
class bird (
  Stdlib::Absolutepath                   $config_file     = '/etc/bird/bird.conf',
  Stdlib::Absolutepath                   $config_dir      = '/etc/bird/bird.d',
  String[1]                              $config_owner    = 'bird',
  String[1]                              $config_group    = 'bird',
  String[1]                              $config_mode     = '0640',
  String[1]                              $config_dir_mode = '0750',
  Array[String[1]]                       $packages        = ['bird2'],
  String[1]                              $package_ensure  = 'installed',
  Hash[String[1], Bird::Define::Generic] $generic_configs = {},
  Array[Bird::Protocols]                 $incl_protocols  = ['device','direct','kernel'],
) {
  # dependencies
  Package<| tag == 'bird-package' |>
  -> File<| tag == 'bird-config' |>
  ~> Service['bird']

  package { $packages:
    ensure => $package_ensure,
    tag    => 'bird-packages',
  }

  include bird::service
  include bird::config
  $incl_protocols.map | String $v | { "bird::protocols::${v}" }.include

  file { $config_dir:
    ensure  => 'directory',
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_dir_mode,
    purge   => true,
    recurse => true,
  }

  $generic_configs.each | String[1] $key, Bird::Define::Generic $val | {
    bird::generic { $key:
      * => $val,
    }
  }
}
