# config for our demo weather app
#
class app::config {

  file { "/etc/nginx/sites-available/default":
    source => "puppet:///modules/${module_name}/default-proxy",
    mode => "0644",
    owner => "root",
    group => "root",
    ensure => present,
    notify => Service['nginx'],
    ;
  } 
}

