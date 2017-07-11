requires "Dancer" => "0";
requires "FindBin" => "0";
requires "Moo" => "0";
requires "Path::Tiny" => "0";
requires "Template::Mustache" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Dancer::FileUtils" => "0";
  requires "Dancer::Test" => "0";
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Test::More" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Test::More" => "0.96";
  requires "Test::Vars" => "0";
};
