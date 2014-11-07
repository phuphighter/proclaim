$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bespoke/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bespoke"
  s.version     = Bespoke::VERSION
  s.authors     = ["Kyle Fazzari"]
  s.email       = ["bespoke@status.e4ward.com"]
  s.homepage    = "https://source.rainveiltech.com/krf/bespoke"
  s.summary     = "Basic blogging engine."
  s.description = "Basic blogging engine."
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.7"

  s.add_development_dependency "sqlite3"
end
