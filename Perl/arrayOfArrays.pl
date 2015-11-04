#!/usr/bin/perl -w

push(@a,"1-1");
push(@a,"1-2");
push(@a,"1-3");
push(@a,"1-4");

push(@aa,\@a);

push(@b,"2-1");
push(@b,"2-2");
push(@b,"2-3");
push(@b,"2-4");

push(@aa,\@b);

foreach $pa (@aa)
{
	printf("---\n");

	foreach $e (@$pa)
	{
		printf("$e \n");
	}
}

