# table config
type Bird::Table = Struct[{
  'nettype'         => Enum['ipv4', 'ipv4 sadr', 'ipv6', 'ipv6 sadr', 'vpn4', 'vpn6', 'roa4', 'roa6', 'flow4', 'flow6', 'mpls'], 
  'debug'           => Optional[Enum['all','off']],
  'sorted'          => Optional[Boolean],
  'trie'            => Optional[Boolean],
  'min_settle_time' => Optional[String[1]],
  'max_settle_time' => Optional[String[1]],
  'gc_threshold'    => Optional[Integer],
  'gc_period'       => Optional[String[1]],
}]
