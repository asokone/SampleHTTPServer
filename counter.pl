#!/usr/bin/perl -w

$|  = 1;

#$file = "/var/www/cgi-bin/counter.txt"; 
$file = "counter.txt"; 
open (FILE, "+>>" . $file) or 
	die "cannot open $file for reading and appending: $!";
flock(FILE, 2) or 
	die "cannot lock $file exclusively: $!";

seek FILE, 0, 0;
	# This function moves to a specified position in a file.
my @file_value = <FILE>;

truncate FILE, 0;
        # This function truncates (reduces) 
	# the size of the file specified by FILEHANDLE 
	# to the specified LENGTH (in bytes)
my $counter;

if ($file_value[0] =~ /^(\d+)$/)
{
	# If the value read in the file is a valid number
	# then set the value of the variable $counter
	# to the value read from the file
   $counter = $1;  
	# $1 is captured by the ()'s in the regular expression
}
else
{
   $counter = 'COUNTER ERROR';  # the regular expression didn't match
}

$counter++;  # auto-increment the same variable with 1
                # note: with this code, if counter is NOT 
		# an incrementable number, $counter will be set to 1.
                # that's not necessarily a bad thing.

print FILE $counter;
		# Update the file new counter value
close (FILE);

print STDOUT "Content-type: text/html\n\n";  # this line is requited for the browser
print STDOUT "
	<center>
You are the<font color = \"red\"> " . $counter . "th</font> visitor to Andialy Sokone's Webpage.<br><br>
<font color=\"green\">Welcome!</font>
	</center>" . "\n";

my $htmlfile = '/var/www/html/index.html';

open(HF, '<', $htmlfile) or die $!;

while(<HF>){
   print $_;
}

close(FH);
