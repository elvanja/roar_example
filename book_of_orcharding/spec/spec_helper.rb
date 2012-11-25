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

require "fruit_orchard"
require 'book_of_orcharding'
# require representers here, since they are not required in gem, see lib/book_of_orcharding.rb
root = File.expand_path('../../lib', __FILE__)
%w{representers}.each do |dir|
  Dir["#{root}/book_of_orcharding/#{dir}/**/*.rb"].sort.each { |source| puts source; require source }
end

require 'json_spec'
RSpec.configure do |config|
  config.include JsonSpec::Helpers
end
