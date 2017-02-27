#!/usr/bin/env perl

# Shashwat Deepali Nagar, 2017
# Jordan Lab, Georgia Tech

# Script for running assembly metric script from the CG-Pipeline on all the assemblies

use strict;

my $usage = "$0 <input directory> <file name>\n\nThe input directory should be organized as:\nInputDir\n|\n|_Sample1\n\t|_fileName\n|_Sample2\n\t|_fileName\n\n";
die $usage if @ARGV < 2;

my ($inDir, $fileName, @sampleList, %metricList);

$inDir = $ARGV[0];
$fileName = $ARGV[1];

chomp(@sampleList = `ls $inDir`);

foreach my $sample (@sampleList) {
  chomp($metricList{$sample} = `./run_assembly_metrics.pl $inDir/$sample/$fileName`);
}

foreach my $sample (sort keys %metricList) {
  print "$sample\t$metricList{$sample}\n";
}
