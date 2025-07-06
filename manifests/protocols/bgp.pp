# @summary add bgp protocols
#
# @param templates
#   bgp templates to create
#   (do not forget to set is_template to true !)
#   Remark: parameter hiera unique merged
# @param instances
#   bgp instances to create
#   Remark: parameter hiera unique merged
# @param default_template_order
#   the default order for templates if no order is set
# @param default_instance_order
#   the default order for instances if no order is set
#
# notes: the distinction betwen templates and instances
#        is only about the storage path of the config.
#        (so you can actually put templates in instances and vice
#        versa)
class bird::protocols::bgp (
  Array[Bird::Bgp::Instance] $templates = [],
  Array[Bird::Bgp::Instance] $instances = [],
  String[1]                  $default_template_order = '55',
  String[1]                  $default_instance_order = '60',
) {
  # first run templates
  $templates.reduce([]) | Array[String[1]] $memo, Bird::Bgp::Instance $i | {
    if pick($i['order'], $default_template_order) in $memo {
      $memo
    } else {
      $memo + pick($i['order'], $default_template_order)
    }
  }.each | String[1] $ord | {
    bird::generic { "${ord}_template_bgp":
      order    => $ord,
      filename => "${ord}-template_bgp.conf",
      content  => $templates.reduce('') |String $memo, Bird::Bgp::Instance $i | {
        if pick($i['order'], $default_template_order) == $ord {
          [$memo, epp('bird/protocols/bgp', $i.delete('order'))].join("\n")
        } else {
          $memo
        }
      },
    }
  }

  # second run instances (ok quite the same code ...)
  # first run templates
  $instances.reduce([]) | Array[String[1]] $memo, Bird::Bgp::Instance $i | {
    if pick($i['order'], $default_instance_order) in $memo {
      $memo
    } else {
      $memo + pick($i['order'], $default_instance_order)
    }
  }.each | String[1] $ord | {
    bird::generic { "${ord}_protocoll_bgp":
      order    => $ord,
      filename => "${ord}-protocoll_bgp.conf",
      content  => $instances.reduce('') |String $memo, Bird::Bgp::Instance $i | {
        if pick($i['order'],$default_instance_order) == $ord {
          [$memo, epp('bird/protocols/bgp', $i.delete('order'))].join("\n")
        } else {
          $memo
        }
      },
    }
  }
}
