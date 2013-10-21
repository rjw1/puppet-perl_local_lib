# == Class: perl_local_lib
#
# Install local::lib and make every user use it.
#
class perl_local_lib {

  package {'liblocal-lib-perl':
    ensure => present,
  }

  file {'/etc/profile.d/locallibperl.sh':
    content => 'eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)',
    require => Package['liblocal-lib-perl'],
  }

}
