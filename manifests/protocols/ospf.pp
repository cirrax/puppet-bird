# @summary add ospf protocols
#
# @param instances
#   ospf instances to create
#   Remark: parameter hiera unique merged
# @param default_instance_order
#   the default order for instances if no order is set
#
# notes: the distinction betwen templates and instances
#        is only about the storage path of the config.
#        (so you can actually put templates in instances and vice
#        versa)
class bird::protocols::ospf (
  Array[Bird::Ospf::Instance] $instances              = [],
  String[1]                   $default_instance_order = '50',
) {
  # loop instances:
  $instances.reduce([]) | Array[String[1]] $memo, Bird::Ospf::Instance $i | {
    if pick($i['order'], $default_instance_order) in $memo {
      $memo
    } else {
      $memo + pick($i['order'], $default_instance_order)
    }
  }.each | String[1] $ord | {
    bird::generic { "${ord}_protocol_ospf":
      order    => $ord,
      filename => "${ord}-protocol_ospf.conf",
      content  => $instances.reduce('') |String $memo, Bird::Ospf::Instance $i | {
        if pick($i['order'],$default_instance_order) == $ord {
          [$memo, epp('bird/protocols/ospf', $i.delete('order'))].join("\n")
        } else {
          $memo
        }
      },
    }
  }
}
