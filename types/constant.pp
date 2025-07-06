# a constant defintion
type Bird::Constant = Variant[
  String[1],
  Struct[{
      'comment' => Optional['comment'],
      'value'   => String[1],
  }]
]
