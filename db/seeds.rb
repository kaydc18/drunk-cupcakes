# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faraday"
require "pry"
require 'json'


response = Faraday.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")

parsed_response = JSON.parse(response.body)

first_drink = parsed_response["drinks"].first

drink_id = first_drink["idDrink"]
drink_name = first_drink["strDrink"]
ingredients = []
measurements = []


first_drink.each do |body, item|
  if body.start_with?("strIngredient") && item != nil
    ingredients << {"#{body}": item}
  elsif body.start_with?("strMeasure") && item != nil
    measurements << {"#{body}": item}
  end
end

ingredients.each do |key, item|
  ingredient = Faraday.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{item}")

  ingredient_response = JSON.parse(ingredient.body)

  ingredient_response.ingredients.each do |key, item|
    
  end

end

binding.pry


