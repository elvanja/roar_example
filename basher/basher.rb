require 'fruit_orchard'
require 'book_of_orcharding'

# require representers here, since they are not required in gem, see book_of_orcharding/lib/book_of_orcharding.rb
require "book_of_orcharding/representers/fruit_representer"
require "book_of_orcharding/representers/fruits_representer"

require_relative 'fruits'
require_relative 'fruit'

fruits = Fruits.get("http://localhost:9292/fruits", 'application/json').fruits
fruits.each do |fruit|
  puts "#{fruit.name} (#{fruit.id}) tastes #{fruit.taste}"
end
