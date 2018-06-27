use strict;

    sub haku {
my $muuttuja1 = 0;
while (my $muuttuja1 == 0) {
print("Syota 1, jos haluat hakea jotain kannasta \n");
print("Syota 2, jos haluat lopettaa ohjelman \n");
	my $valinta = <>;
	use experimental qw( switch );
given($valinta){
  when(1) {
  	$muuttuja1 = 1;
	print("Valitsit haun\n");
	print("Syota hakusana, jolla etsitaan teosta:\n");
	my $find = <STDIN>;
	print("Hait teoksia hakusanalla $find \n");
	chomp $find;
	open (NEW, ">", "result.txt" ) or die "could not open:$!";
	open (FILE, "<", "MARCDATA.xml") or die "could not open:$!";
	while (<FILE>) {
	print NEW if (/$find/);
	}
	print("Haku loysi: \n\n");
	close (FILE);
	close (NEW);
	open(DATA, "<result.txt") or die "Couldn't open file file.txt, $!";

	while(<DATA>) {
   print "$_";
	}
	haku();
	}
  when(2) { 
	print("Ohjelma on paattynyt.\n");
	  sleep 1;
		$muuttuja1 = 1;
		last;
  }
  default { print 'Virheellinen valinta. yrita uuestaa\n ' }
}
}
}

print("Tervetuloa hakuohjelman pariin \n");
haku();