package App::which_package;

use strict;
use warnings;
use Alien::Packages;
use Path::Class qw( file dir );
use Text::Table;
use File::Which qw( which );

# ABSTRACT: Determine which package installed a file
# VERSION

=head1 SYNOPSIS

 % which_package /path/to/file [ ... ]

=head1 DESCRIPTION

Print out package information for packages that own a given file.

For each file on the command line this program will print out the
package name and type of package.  It uses L<Alien::Packages> to
do this portably, so it should work, with various limitations, 
portably on a wide variety of platforms.

=head1 OPTIONS

none, as yet.

=cut

my $ap = Alien::Packages->new;

sub main
{
  my($class, @files) = @_;
  
  unless(@files > 0)
  {
    say STDERR "usage: which_package /path/to/file";
    return 1;
  }
  
  my $table = Text::Table->new(qw( file package type ));
  
  my %owners = $ap->list_fileowners(
    map { $_->absolute } 
    map { -d $_ ? dir($_) : file($_) } 
    map { -e $_ ? $_ : which($_) }
    @files
  );

  my $count = 0;
  
  foreach my $file (sort keys %owners)
  {
    foreach my $package (sort { $a->{Package} cmp $b->{Package} } @{ $owners{$file} })
    {
      $table->add($file, $package->{Package}, $package->{PkgType});
      $count++;
    }
  }
  
  if($count > 0)
  {
    print $table;
    return 0;
  }
  else
  {
    return 2;
  }
}

1;
