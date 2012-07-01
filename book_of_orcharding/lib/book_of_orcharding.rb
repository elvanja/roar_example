require "book_of_orcharding/version"

root = File.expand_path('..', __FILE__)
%w{util}.each do |dir|
  Dir["#{root}/book_of_orcharding/#{dir}/**/*.rb"].sort.each { |source| require source }
end

module Orcharding
end
