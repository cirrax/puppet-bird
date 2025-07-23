# bgp local definition
type Bird::Bgp::Local = Struct[{
    'ip'     => Optional[String],
    'port'   => Optional[Integer],
    'as'     => Optional[Integer],
}]
