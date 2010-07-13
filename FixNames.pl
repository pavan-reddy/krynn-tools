#!/usr/bin/env perl
# Version: $Id: FixNames.pl,v 1.14 2010/07/13 08:33:45 root Exp $
#
# WARNING: Edit with 'vi', not 'pico'!!
#
# rename script examples from lwall:
#       rename 's/\.orig$//' *.orig
#       rename 'y/A-Z/a-z/ unless /^Make/' *
#       rename '$_ .= ".bad"' *.f
#       rename 'print "$_: "; s/foo/bar/ if <stdin> =~ /^y/i' *

use File::Find;

sub new_name {
	$transform_op =
		's/ /_/g;
		s/�/e/g;
		s/\302\257/o/g;
		s/\303\207/e/g;
		s/\303\253/e/g;
		s/\303\251/e/g;
		s/\303\250/e/g;
		s/\303\240/e/g;
		s/\200/e/g;
		s/\201/e/g;
		s/\202/e/g;
		s/\203/e/g;
		s/\204/i/g;
		s/\205/i/g;
		s/\206/i/g;
		s/\207/i/g;
		s/\210/e/g;
		s/\211/o/g;
		s/\212/o/g;
		s/\213/o/g;
		s/\214/o/g;
		s/\216/o/g;
		s/\217/u/g;
		s/\340/a/g;
		s/\341/a/g;
		s/\342/a/g;
		s/\343/a/g;
		s/\344/a/g;
		s/\345/a/g;
		s/\346/a/g;
		s/\350/e/g;
		s/\351/e/g;
		s/\352/e/g;
		s/\353/e/g;
		s/\354/i/g;
		s/\355/i/g;
		s/\356/i/g;
		s/\357/i/g;
		s/\362/o/g;
		s/\363/o/g;
		s/\364/o/g;
		s/\365/o/g;
		s/\366/o/g;
		s/\370/o/g;
		s/\371/u/g;
		s/\372/u/g;
		s/\373/u/g;
		s/\374/u/g;
		s/\376//g;
		s/�/e/g;
		s/�/a/g;
		s/�/a/g;
		s/�/u/g;
		s/�/e/g;
		s/�/a/g;
		s/\376//g;
		s/&/_/g;
		s/\\\/_/g;
		s/!/_/g;
		s/#/_/g;
		s/\*/_/g;
		s/`/_/g;
		s/\"/_/g;
		s/\(/_/g;
		s/\)/_/g;
		s/,/_/g;
		s/\[/-_/g;
		s/\]/_/g;
		s/__/_/g;
		s/^_//g;
		s/^-//g;
		s/_\.([A-z]*$)/\.\1/g;
		s/\'/_/g';

	$old_file_name = $_;
	eval $transform_op;
	$new_file_name = $_;
	die $@ if $@;
	if ( $old_file_name eq $new_file_name ) {
		# print("Files \"$old_file_name\" and \"$new_file_name\" are identical!\n");
	} else {
		print("\"$old_file_name\" -> \"$new_file_name\"\n");
		rename($old_file_name,$new_file_name) unless $old_file_name eq $new_file_name;
	}

}



sub Main {
	@ARGV = qw(.) unless @ARGV;

	for (@ARGV) {
		new_name($_);
	}
}

&Main();
