package Perl::SVCount;
use XSLoader ();

our $VERSION = '0.01';

XSLoader::load 'Perl::SVCount', $VERSION;

# keep it lightweight, since this is an instrumentation module
sub import {
    *{caller() . '::' . $_} = *$_ for qw/sv_count sv_objcount/;
}

1;

__END__

=head1 NAME

Perl::SVCount - Get global count of allocated SVs

=head1 SYNOPSIS

    my $count = sv_count();
    ... # some code here
    say "Allocated " . (sv_count() - $count) . " more SVs";

=head1 DESCRIPTION

This module allows to access perl's internal global counters of allocated SVs
and objects. This might be useful for quickly detecting memory leaks.

C<sv_count()> returns how many SVs (scalar values) are currently allocated.

C<sv_objcount()> returns how many blessed SVs (pbjects) are currently allocated.

=head1 AUTHOR

Copyright (c) 2012 Rafael Garcia-Suarez. This program is free software; you
may redistribute it and/or modify it under the same terms as Perl itself.
