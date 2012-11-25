require "fruit_orchard/version"

root = File.expand_path('..', __FILE__)
%w{util persistence domain}.each do |dir|
  Dir["#{root}/fruit_orchard/#{dir}/**/*.rb"].sort.each { |source| require source }
end

module FruitOrcharding
end
