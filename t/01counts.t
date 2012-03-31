#!perl
use 5.014;
use Test::More tests => 5;
use Perl::SVCount;
my (@x, @y);
my $c = sv_count;
ok($c > 0, "sv_count returns positive value");
my $o = sv_objcount;
ok($o > 0, "sv_objcount returns positive value");
$c = sv_count; # refresh
push @x, "foo" for 1..100;
my $c2 = sv_count;
is($c2 - $c, 100);
push @y, bless { } for 1..100;
my $o2 = sv_objcount;
is($o2 - $o, 100);
@y = ();
my $o3 = sv_objcount;
is($o, $o3, "Return to initial count of objects");
