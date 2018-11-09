# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning up database...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating database'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients = JSON.parse(ingredients)
ingredients = ingredients["drinks"]

ingredients.each do |ingredient|
  Ingredient.create!(
    name: ingredient.values[0]
  )
end

cocktails = ['Old Fashioned', 'Margarita', 'Dry Martini', 'Negroni', 'Daquiri', 'Manhattan', 'Whiskey Sour', 'Bloody Mary', 'Moscow Mule', 'Aperol Spritz']
cocktails.each do |cocktail|
  Cocktail.create!(
    name: cocktail
  )
end

puts 'Finished!'

