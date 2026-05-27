# ospf area definition
type Bird::Ospf::Area = Struct[{
  'stub'                  => Optional[Boolean],
  'nssa'                  => Optional[Boolean],
  'summary'               => Optional[Boolean],
  'default_nssa'          => Optional[Boolean],
  'default_cost'          => Optional[Integer],
  'default_cost2'         => Optional[Integer],
  'translator'            => Optional[Boolean],
  'translator_stability'  => Optional[Integer],
  'networks'              => Optional[Array],
  'external'              => Optional[Array],
  'stubnet'               => Optional[Hash[String[1],Bird::Ospf::Stubnet]],
  'interfaces'            => Optional[Hash[String[1],Bird::Ospf::Interface]],
}]
