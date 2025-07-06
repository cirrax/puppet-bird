# @summary generic define to add a file into the config directory
#
# @param filename
#   filename to use
#   defaults to undef wich generates a filename in
#   the form "${order}-${title}.conf"
# @param order
#   order to use to generate filename
# @param comments
#   Array of comments to add
# @param content
#   content to put into the file
#
define bird::generic (
  Optional[String[1]] $filename = undef,
  String[1]           $order    = '00',
  Array[String[1]]    $comments = [],
  Optional[String]    $content  = undef,
) {
  include bird

  $_filename = pick($filename, "${order}-${title}.conf")

  file { "${bird::config_dir}/${$_filename}":
    owner   => $bird::config_owner,
    group   => $bird::config_group,
    mode    => $bird::config_dir_mode,
    content => epp('bird/generic', {
        comments => $comments,
        content  => $content,
    }),
    tag     => 'bird-config',
  }
}
