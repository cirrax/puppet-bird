# @summary add static protocols
#
# @param instances
#   static instances to create
#   Remark: parameter hiera unique merged
# @param default_instance_order
#   the default order for instances if no order is set
#
class bird::protocols::static (
  Array[Bird::Static::Instance] $instances              = [],
  String[1]                     $default_instance_order = '20',
) {
  # loop instances:
  $instances.reduce([]) | Array[String[1]] $memo, Bird::Static::Instance $i | {
    if pick($i['order'], $default_instance_order) in $memo {
      $memo
    } else {
      $memo + pick($i['order'], $default_instance_order)
    }
  }.each | String[1] $ord | {
    bird::generic { "${ord}_protocol_static":
      order    => $ord,
      filename => "${ord}-protocol_static.conf",
      content  => $instances.reduce('') |String $memo, Bird::Static::Instance $i | {
        if pick($i['order'],$default_instance_order) == $ord {
          [$memo, epp('bird/protocols/static', $i.delete('order'))].join("\n")
        } else {
          $memo
        }
      },
    }
  }
}
