# @summary write the main config file
#
# @param router_id
#   router ID. It is a unique identification of your router,
#   usually one of IPv4 addresses of the router.
# @param log
#   log option
# @param tables
#   tables to initialize
# @param constants
#   Hash of defined constants
#   Remark: hiera hash merged
# @param generic
#   generic config options
#   Remark: hiera hash merged
#
class bird::config (
  Optional[String[1]]            $router_id = undef,
  Optional[String[1]]            $log       = undef,
  Hash[String[1],Bird::Table]    $tables    = {},
  Hash[String[1],Bird::Constant] $constants = {},
  Hash[String[1],Bird::Conf]     $generic   = {},
) {
  include bird

  file { $bird::config_file:
    owner   => $bird::config_owner,
    group   => $bird::config_group,
    mode    => $bird::config_dir_mode,
    content => epp('bird/config.epp', {
      router_id  => $router_id,
      log        => $log,
      tables     => $tables,
      constants  => $constants,
      generic    => $generic,
      includedir => $bird::config_dir,
    }),
    tag     => 'bird-config',
  }
}
