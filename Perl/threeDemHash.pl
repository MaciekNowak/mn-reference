#!/usr/bin/perl

$h{ 1 }{ 1 }{ 1 }='a';
$h{ 1 }{ 11 }{ 111 }='aa';
$h{ 2 }{ 222 }{ 333 }='bbb';
$h{ 2 }{ 22 }{ 222 }='bb';
$h{ 3 }{ 33 }{ 333 }='cc';
$h{ 5 }{ 55 }{ 555 }='ee';
$h{ 5 }{ 555 }{ 555 }='eee';
$h{ 4 }{ 44 }{ 4444 }='dd';

printf("-One Way-\n");

foreach $i (keys %h)
{
	$p=$h{ $i };
	foreach $ii (keys %$p)
	{
		$p=$h{ $i }{ $ii };
		foreach $iii (keys %$p)
		{
			printf("{%s}{%s}{%s}=%s\n",$i,$ii,$iii,$h{ $i }{ $ii }{ $iii });
		}
	}
}

printf("\n-Another Way-\n");

foreach $i (keys %h)
{
	foreach $ii (keys %{$h{ $i }})
	{
		foreach $iii (keys %{$h{ $i }{ $ii }})
		{
			printf("{%s}{%s}{%s}=%s\n",$i,$ii,$iii,$h{ $i }{ $ii }{ $iii });
		}
	}
}

printf("\n-Sorting-\n");

foreach $i (sort keys %h)
{
	foreach $ii (sort keys %{$h{ $i }})
	{
		foreach $iii (sort keys %{$h{ $i }{ $ii }})
		{
			printf("{%s}{%s}{%s}=%s\n",$i,$ii,$iii,$h{ $i }{ $ii }{ $iii });
		}
	}
}

printf("\n-Via a pointer-\n");

cmpHashes(\%h);

sub cmpHashes($)
{
    my($hashPtr) = @_;

    foreach my $i (keys %$hashPtr)
    {
        foreach my $ii (keys %{$hashPtr->{ $i }})
        {
            foreach my $iii (keys %{$hashPtr->{ $i }{ $ii }})
            {
			    printf("{%s}{%s}{%s}=%s\n", $i, $ii, $iii,
                                            $hashPtr->{ $i }{ $ii }{ $iii });
            }
        }
    }
}

