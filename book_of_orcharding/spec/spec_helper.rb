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

require 'book_of_orcharding'

Dir['./spec/matchers/**/*.rb'].sort.each { |matcher| require matcher }
RSpec.configure do |config|
  config.include Matchers
end
