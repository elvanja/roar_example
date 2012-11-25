# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fruit_orchard/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vanja Radovanović"]
  gem.email         = ["elvanja@gmail.com"]
  gem.description   = %q{in memory persistence for fruit_orcharding}
  gem.summary       = %q{gem that implements the persistence layer for book_of_orcharding in memory.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "fruit_orchard"
  gem.require_paths = ["lib"]
  gem.version       = FruitOrchard::VERSION

  # development
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "ci_reporter"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "simplecov-rcov"
end
