# bgp instance definition
type Bird::Bgp::Instance = Struct[{
  'order'                     => Optional[String[1]],
  'channels'                  => Optional[Hash[String[1],Bird::Channel]],
  'bgp_name'                  => Optional[String[1]],
  'template'                  => Optional[String[1]],
  'is_template'               => Optional[Boolean],
  'neighbor'                  => Optional[Bird::Bgp::Neighbor],
  'local'                     => Optional[Bird::Bgp::Local],
  'interface'                 => Optional[String[1]],
  'vrf'                       => Optional[String[1]],
  'enable_extended_messages'  => Optional[Boolean],
  'require_extended_messages' => Optional[Boolean],
  'capabilities'              => Optional[Boolean],
  'advertise_hostname'        => Optional[Boolean],
  'require_hostname'          => Optional[Boolean],
  'disable_after_error'       => Optional[Boolean],
}]
