# @summary add a default direct protocol
#
# @param disabled
#   set to true to disable the protocol
# @param ipv4
#   true: Connect to default IPv4 table
# @param ipv6
#   true: Connect to default IPv6 table
# @param interfaces
#   Array of interface definitions
#
# @note for more sophisticated configs, use the bird::generic resource
#
class bird::protocols::direct (
  Boolean          $disabled = true,
  Boolean          $ipv4     = true,
  Boolean          $ipv6     = true,
  Array[String[1]] $interfaces = [],
) {
  bird::generic { 'protocol_direct':
    order   => '51',
    content => epp('bird/protocols/direct', {
      'disabled'   => $disabled,
      'ipv4'       => $ipv4,
      'ipv6'       => $ipv6,
      'interfaces' => $interfaces,
    }),
  }
}
