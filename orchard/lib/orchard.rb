require "orchard/version"

root = File.expand_path('..', __FILE__)
%w{util persistence}.each do |dir|
  Dir["#{root}/orchard/#{dir}/**/*.rb"].sort.each { |source| require source }
end

module Orcharding
end
