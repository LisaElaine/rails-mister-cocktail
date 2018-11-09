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

puts 'Creating cocktails...'

cocktails = [
  { name: "MEZCAL COCKTAIL: DJ LISA", description: "Mezcal finds its perfect matches in citrus and cinnamon." },
  { name: "FIGURATI: A LAMBRUSCO COCKTAIL", description: "This low-abv sipper was made for brunch." },
  { name: "BRANDY COCKTAIL: THE WORLD, REVERSED", description: "A unique combo of brandy, Branca Menta and amaro." },
  { name: "IRISH WHISKEY COCKTAIL: ROAD TO TRALEE", description: "Warm up with whiskey, banana liqueur and bitters." },
  { name: "DEAD RABBIT’S REAL IRISH PUNCH", description: "Perfect for your next fall gathering. " },
  { name: "DEATH & CO.’S IDEAL MARTINI RECIPE", description: "From the beautiful new book, Cocktail Codex." },
  { name: "CORPSE REVIVER #2", description: "A classic cocktail with a name that could wake the dead." },
  { name: "TEA COCKTAIL: SING LIKE A BEE", description: "Earl Grey-infused gin pairs perfectly with honey and citrus." },
  { name: "SALTY STEPHEN", description: "Sweet vermouth shines in this punchy riff on the Bitter Giuseppe." },
  { name: "THE OFFERING: A TEQUILA COCKTAIL", description: "Spiced pear shrub, aged tequila and Cardamaro make for a perfect blend of fall flavors." },
  { name: "ORCHARD THIEF: A FALL COCKTAIL", description: "A spiced apple shrub anchors this whiskey cocktail from NYC." }
]

Cocktail.create(cocktails)


puts 'Finished!'

