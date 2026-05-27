# static route definition
type Bird::Static::Via = Variant[Stdlib::Ip::Address, String[1],Struct[{
  'ip' => Optional[Stdlib::Ip::Address],
  'direct' => Optional[String[1]],
  'dev'    => Optional[String[1]],
  'weight' => Optional[Integer],
  'bfd'    => Optional[Boolean],
  'onlink' => Optional[Boolean],
}]]
