# static instance definition
type Bird::Static::Instance = Struct[{
  'order'                 => Optional[String[1]],
  'channels'              => Optional[Hash[String[1],Bird::Channel]],
  'check_link'            => Optional[Boolean],
  'igp_table'             => Optional[String[1]],
  'route'                 => Optional[Hash[Stdlib::Ip::Address,Variant[Bird::Static::Sinkroute,Bird::Static::Route,Array[Bird::Static::Route]]]],
}]
