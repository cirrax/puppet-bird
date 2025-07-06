# bgp instance definition
type Bird::Ospf::Instance = Struct[{
  'order'                 => Optional[String[1]],
  'channels'              => Optional[Hash[String[1],Bird::Channel]],
  'ospf_name'             => Optional[String[1]],
  'vrf'                   => Optional[String[1]],
  'version'               => Optional[Enum['v2','v3']],
  'rfc1583compat'         => Optional[Boolean],
  'rfc5838'               => Optional[Boolean],
  'stub_router'           => Optional[Boolean],
  'tick'                  => Optional[Integer],
  'ecmp'                  => Optional[Variant[Boolean, String[1]]],
  'merge_external'        => Optional[Boolean],
  'graceful_restart'      => Optional[Variant[Boolean, Enum['aware']]],
  'graceful_restart_time' => Optional[Integer],
  'areas'                 => Hash[String[1],Bird::Ospf::Area],
}]
