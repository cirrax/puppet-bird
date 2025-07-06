# @summary ensure the bird service
#
# @param service_ensure
#   Whether a service should be running.
#   Defaults to 'running'
# @param service_enable
#   Whether a service should be enabled.
#   Defaults to true
# @param service_name
#   The name of the service
#
class bird::service (
  String  $service_ensure = 'running',
  Boolean $service_enable = true,
  String  $service_name   = 'bird',
) {
  service { 'bird':
    ensure => $service_ensure,
    enable => $service_enable,
    name   => $service_name,
  }
}
