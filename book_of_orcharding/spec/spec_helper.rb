# need to load before anything else for coverage to work
# coverage setup begin
require 'simplecov'
require 'simplecov-rcov'

if ENV["COVERAGE"]
  class SimpleCov::Formatter::CiFormatter
    def format(result)
      SimpleCov::Formatter::RcovFormatter.new.format(result)
      SimpleCov::Formatter::HTMLFormatter.new.format(result)
    end
  end

  SimpleCov.start do
    formatter SimpleCov::Formatter::CiFormatter
    coverage_dir 'reports/coverage'
    add_filter 'vendor'
    add_filter 'spec'
  end
end
# coverage setup end

# TODO see if there is a way to decouple representer from Fruit class
# don't require representers here, this would require Fruit class to be declared here too
# see /lib/book_of_orcharding/representers/fruits_representer for details

require 'json_spec'
RSpec.configure do |config|
  config.include JsonSpec::Helpers
end
