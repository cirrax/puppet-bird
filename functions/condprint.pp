# used for templates to conditional print statements 
#
# @param prefix
#   prefix the value with this string (if value is not undef)
# @param val
#   the value to print if it is not undef
# @param postfix
#   postfix the value with this string (if value is not undef)
# @param is_string
#   setting this to true results in encapsulating value
#   in "
#
# @return printable string for bird config file
#
function bird::condprint(
  String                                    $prefix    = '',
  Optional[Variant[String,Integer,Boolean]] $val       = undef,
  Optional[String]                          $postfix   = undef,
  Boolean                                   $is_string = false,
) >> String {
  if $val =~ Boolean and $val {
    $_val = 'on'
  } elsif $val =~ Boolean and ! $val {
    $_val = 'off'
  } else {
    $_val = $val
  }

  if $_val and $is_string and $postfix {
    [$prefix, "\"${_val}\"", $postfix].join(' ')
  } elsif $_val and $is_string {
    [$prefix, "\"${_val}\""].join(' ')
  } elsif $_val and $postfix {
    [$prefix, $_val, $postfix].join(' ')
  } elsif $_val {
    [$prefix, $_val].join(' ')
  } else {
    ''
  }
}
