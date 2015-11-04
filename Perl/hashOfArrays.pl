#!/usr/bin/perl -w

push(@{ $h{ 1 } },'1-1');
push(@{ $h{ 1 } },'1-2');
push(@{ $h{ 1 } },'1-3');
push(@{ $h{ 1 } },'1-4');
push(@{ $h{ 1 } },'1-5');
push(@{ $h{ 2 } },'2-1');
push(@{ $h{ 2 } },'2-2');
push(@{ $h{ 2 } },'2-3');

foreach $i (sort keys %h)
{
	printf("$i -> [ ");
	foreach $v (@{ $h{ $i } })
	{
		printf("$v ");
	}
	printf("]\n");
}

