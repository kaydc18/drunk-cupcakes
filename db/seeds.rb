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

recipe = Recipe.create(drink_id: "#{drink_id}", drink_name: "#{drink_name}")


first_drink.each do |body, item|
  if body.start_with?("strIngredient") && item != nil
    ingredient_number = body.delete("strIngredient")
    ingredients << {"#{ingredient_number}": item}
  elsif body.start_with?("strMeasure") && item != nil
    measurement_number = body.delete("strMeasure")
    measurements << {"#{measurement_number}": item}
  end
end

ingredients.each do |ingredient|
  ingredient.each do |key, item|
    ingredient_search = Faraday.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{item}")

    ingredient_response = JSON.parse(ingredient_search.body)

    ingredient_response["ingredients"].each do |ingredient|
      ingredient_id = ingredient["idIngredient"]
      ingredient_name = ingredient["strIngredient"]
      
      if ingredient["strAlcohol"] === "Yes"
        ingredient_alcohol = true
      else
        ingredient_alcohol = false
      end
      measurements.each do |measure|
        measure.each do |measure_key, measure_item|
          if measure_key === key
            ingredient = Ingredient.create(ingredient_id: "#{ingredient_id}", ingredient_name: "#{ingredient_name}", ingredient_alcohol: "#{ingredient_alcohol}")
            Measurement.create(measurement: "#{measure_item}", recipe: recipe, ingredient: ingredient)
          end
        end
      end
    end
  end
end




binding.pry


