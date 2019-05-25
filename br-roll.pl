#!/usr/bin/perl

use Math::Random::Secure qw(irand);

sub roll_the_dice {
  my $formula = $_[0];
  if ($formula =~ /^(\d+)d(\d+)([\+\-]\d+)?$/i) {
    my $num = int($1);
    my $fac = int($2);
    my $plus = int($3);
    my $detail = '';
    my $aux = 0;
    my $total = 0;
    for (my $i = 0; $i < $num; $i++) {
      $aux = irand($fac) + 1;
      $total += $aux;
      $detail = "$detail $aux ";
    };
    if ($plus != 0) {
      $total += $plus;
      $detail = "$detail $plus";
    }
    print "$total ($detail)\n";
  } else {
    print "Use with number of dies, faces of each dice and a optional plus\n";
    print "  Examples: 2d6, 1d20, 3d12, 4d10-3, 1d9+4\n";
  };
};

foreach my $r(@ARGV) {
  roll_the_dice($r);
};
