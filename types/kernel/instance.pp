# Kernel instance definition
type Bird::Kernel::Instance = Struct[{
  'table'             => Optional[String[1]],
  'import'            => Optional[String[1]],
  'export'            => Optional[String[1]],
  'persist'           => Optional[Boolean],
  'scan_time'         => Optional[Integer],
  'learn'             => Optional[Variant[Boolean,Enum['all']]],
  'kernel_table'      => Optional[Variant[Integer,String[1]]],
  'metric'            => Optional[Integer],
  'gracefull restart' => Optional[Boolean],
  'merge_paths'       => Optional[Boolean],
  'netlink_rx_buffer' => Optional[Integer],
}]
