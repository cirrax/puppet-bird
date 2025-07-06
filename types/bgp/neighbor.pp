# bgp neighbor definition
type Bird::Bgp::Neighbor = Struct[{
  'ip'     => Optional[String[1]],
  'prefix' => Optional[String[1]],
  'port'   => Optional[Integer],
  'as'     => Optional[Integer],
  'type'   => Optional[Enum['internal','external']],
}]
