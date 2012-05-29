# -*- encoding: utf-8 -*-
require File.expand_path('../lib/book_of_orcharding/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vanja Radovanović"]
  gem.email         = ["elvanja@gmail.com"]
  gem.description   = %q{book of orcharding}
  gem.summary       = %q{gem dedicated to providing the core domain functionality}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "book_of_orcharding"
  gem.require_paths = ["lib"]
  gem.version       = BookOfOrcharding::VERSION

  # development
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "ci_reporter"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "simplecov-rcov"

  # runtime
  gem.add_runtime_dependency "roar"
end
