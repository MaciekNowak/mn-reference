#!/usr/bin/perl -w

$h{ 1 }{ 1 }='a';
$h{ 1 }{ 11 }='aa';
$h{ 2 }{ 222 }='bbb';
$h{ 2 }{ 22 }='bb';
$h{ 3 }{ 33 }='cc';
$h{ 5 }{ 55 }='ee';
$h{ 5 }{ 555 }='eee';
$h{ 4 }{ 44 }='dd';

printf("-One Way-\n");

foreach $i (keys %h)
{
	$p=$h{ $i };
	foreach $ii (keys %$p)
	{
		printf("{%s}{%s}=%s\n",$i,$ii,$h{ $i }{ $ii });
	}
}

printf("\n-Another Way-\n");

foreach $i (keys %h)
{
	@s=keys %{$h{ $i }};
	printf("subhash size for $i is %d\n",$#s+1);

	foreach $ii (keys %{$h{ $i }})
	{
		printf("{%s}{%s}=%s\n",$i,$ii,$h{ $i }{ $ii });
	}
}

printf("\n-Sort-\n");

foreach $i (sort keys %h)
{
	foreach $ii (sort keys %{$h{ $i }})
	{
		printf("{%s}{%s}=%s\n",$i,$ii,$h{ $i }{ $ii });
	}
}
