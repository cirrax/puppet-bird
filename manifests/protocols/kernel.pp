# @summary add a default kernel protocol
#
# @param proto_enable
#   protocols to enable
# @param ipv4
#   ipv4 protocol configuration
# @param ipv6
#   ipv6 protocol configuration
#
# @note for more sophisticated configs, use the bird::generic resource
#
class bird::protocols::kernel (
  Array[Enum['ipv4','ipv6']] $proto_enable = ['ipv4','ipv6'],
  Bird::Kernel::Instance     $ipv4         = {},
  Bird::Kernel::Instance     $ipv6         = {},
) {
  if 'ipv4' in $proto_enable {
    $content_ipv4 = epp('bird/protocols/kernel', $ipv4 + { 'proto' => 'ipv4' })
  } else {
    $content_ipv4 = ''
  }
  if 'ipv6' in $proto_enable {
    $content_ipv6 = epp('bird/protocols/kernel', $ipv6 + { 'proto' => 'ipv6' })
  } else {
    $content_ipv6 = ''
  }

  bird::generic { 'protocol_kernel':
    comments => [
      'The Kernel protocol is not a real routing protocol. Instead of communicating',
      'with other routers in the network, it performs synchronization of BIRD',
      'routing tables with the OS kernel. One instance per table.',
    ],
    order    => '51',
    content  => "${content_ipv4}\n${content_ipv6}",
  }
}
