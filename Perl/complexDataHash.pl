#!/usr/bin/perl -w

%h = (
    'NYC' =>
             {
                 state => "NY",
                 population => 7000000
             },
    'Minneapolis' =>
             {
                 state => "MN",
                 population => 1000000
             },
    'Kansas City' =>
             {
                 state => "KS",
                 population => 1500000
             }
    );

foreach $city (sort keys %h)
{
    $p = $h{ $city };
    printf("%s, %s of %d\n", $city, $p->{ state }, $p->{ population });
}

