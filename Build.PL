
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Dancer" => 0,
    "Dancer::FileUtils" => 0,
    "Dancer::Test" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => "0.88"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Wrapper for the Mustache template system",
  "dist_author" => [
    "Yanick Champoux <yanick\@babyl.dyndns.org>"
  ],
  "dist_name" => "Dancer-Template-Mustache",
  "dist_version" => "0.1.1",
  "license" => "perl",
  "module_name" => "Dancer::Template::Mustache",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dancer::Config" => 0,
    "Dancer::Template::Abstract" => 0,
    "Template::Mustache" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
