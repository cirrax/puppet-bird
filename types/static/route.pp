# static route definition
type Bird::Static::Route = Struct[{
  'comment'        => Optional[String[1]],
  'as'             => Optional[Integer],
  'max'            => Optional[Integer],
  'dev'            => Optional[String[1]],
  'via'            => Optional[Variant[Bird::Static::Via, Array[Bird::Static::Via]]],
}]
