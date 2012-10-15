
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "POE eris message dispatcher",
  "AUTHOR" => "Brad Lhotsky <brad.lhotsky\@gmail.com>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Pod::Coverage::TrustPod" => 0,
    "Test::More" => 0,
    "Test::Perl::Critic" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "POE-Component-Server-eris",
  "EXE_FILES" => [],
  "LICENSE" => "bsd",
  "NAME" => "POE::Component::Server::eris",
  "PREREQ_PM" => {
    "POE" => 0,
    "POE::Component::Server::TCP" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



