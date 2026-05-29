class basic_files {
  file { '/tmp/basic-files':
    ensure  => file,
    content => "status=doing\n",
  }
}
