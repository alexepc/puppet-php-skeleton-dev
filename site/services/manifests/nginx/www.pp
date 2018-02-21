class services::nginx::www (
  Array $versions = $services::nginx::params::versions,
  Hash $projects  = $services::nginx::params::projects,
  String $domain = $services::nginx::params::domain
) {
  info("Initialize")

  $projects.each |String $project, Array $list| {
    $list.each |Integer $index, Hash $sub| {
      # create folder for each project
      $name = $sub['name'];

      file {[
        "/var/www/$name.$project.$domain",
        "/var/www/$name.$project.$domain/public"
      ]:
        ensure => 'directory',
        owner  => 'www-data',
        group  => 'www-data',
        mode   => '0755',
        require => [
          Package['nginx-full']
        ]
      }

      file { "/etc/nginx/sites-available/$name.$project.conf":
        notify  => Service["nginx"],
        ensure  => file,
        owner   => 'www-data',
        group   => 'www-data',
        mode    => '0755',
        content => epp('services/nginx/dummy.conf.epp', {
          'name'    => $name,
          'php'     => $sub['php'],
          'project' => $project,
          'domain'  => $domain
        }),
        require => [
          File["/var/www/$name.$project.$domain/public"]
        ]
      }

      file { "/etc/nginx/sites-enabled/$name.$project.conf":
        ensure => 'link',
        target => "/etc/nginx/sites-available/$name.$project.conf",
        require => [
          File["/etc/nginx/sites-available/$name.$project.conf"]
        ]
      }

      # At this point we can extend project installation like git clone, build and e.t.c
      # by default it will be index.php with php info.
      file { "/var/www/$name.$project.$domain/public/index.php":
        ensure  => file,
        owner   => 'www-data',
        group   => 'www-data',
        mode    => '0755',
        content => epp('services/nginx/index.php.epp'),
        require => [
          File["/var/www/$name.$project.$domain/public"]
        ]
      }
    }
  }
}