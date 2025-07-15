# Filter definition
type Bird::Filter = Struct[{
    'order'       => Optional[String[1]],
    'filter_name' => Optional[String[1]],
    'comments'    => Variant[String[1],Array[String[1]]],
    'local_vars'  => Optional[Hash[String[1], Bird::Datatypes]],
    'content'     => Optional[String],
}]
