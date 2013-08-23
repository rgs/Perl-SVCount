#!perl
use 5.014;
use Test::More tests => 3;
use Perl::SVCount;
my (@x, @y);
my $c = sv_count;
ok($c > 0, "sv_count returns positive value");
$c = sv_count; # refresh
push @x, "foo$_" for 1..100;
my $c2 = sv_count;
is($c2 - $c, 100);

$c2 = sv_count; # refresh
@x = ();
my $c3 = sv_count;
is($c2 - $c3, 100);
