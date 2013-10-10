# which\_package [![Build Status](https://secure.travis-ci.org/plicease/App-which_package.png)](http://travis-ci.org/plicease/App-which_package)

Determine which package installed a file

# SYNOPSIS

    % which_package /path/to/file [ ... ]

# DESCRIPTION

Print out package information for packages that own a given file.

For each file on the command line this program will print out the
package name and type of package.  It uses [Alien::Packages](http://search.cpan.org/perldoc?Alien::Packages) to
do this portably, so it should work, with various limitations, 
portably on a wide variety of platforms (Debian, RedHat and Cygwin
have been tested).

If given a command, `which_package` will use [File::Which](http://search.cpan.org/perldoc?File::Which) to
find the location of that command and use that to query the package
manager for ownership.

# OPTIONS

none, as yet.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
