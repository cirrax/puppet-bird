# @summary add a default device protocol
#
# @note for more sophisticated configs, use the bird::generic resource
#
class bird::protocols::device () {
  bird::generic { 'protocol_device':
    order   => '50',
    content => epp('bird/protocols/device'),
  }
}
