# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Ingredient.destroy_all
Measurement.destroy_all

require "faraday"
require "pry"
require 'json'


response = Faraday.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")

parsed_response = JSON.parse(response.body)

drink = parsed_response["drinks"]

drink.each do |drink|
  ingredients = []
  measurements = []
  drink_id = drink["idDrink"]
  drink_name = drink["strDrink"]
  drink.each do |key, item|
    if key.start_with?("strIngredient") && item != nil
      ingredient_number = key.delete("strIngredient")
      ingredients << {"#{ingredient_number}": item}
    end
    if key.start_with?("strMeasure")&& item != nil
        measurement_number = key.delete("strMeasure")
        measurements << {"#{measurement_number}": item}
    end
  end
  
  while measurements.length < ingredients.length
    measurement_number = measurements.length
    measurement_number += 1
    measurements << {"#{measurement_number}": "none"}
  end
  
  recipe = Recipe.create(drink_id: "#{drink_id}", drink_name: "#{drink_name}")

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
        if Ingredient.find_by(ingredient_id: "#{ingredient_id}") != nil
          ingredient = Ingredient.find_by(ingredient_id: "#{ingredient_id}") 
        else
          ingredient = Ingredient.create(ingredient_id: "#{ingredient_id}", ingredient_name: "#{ingredient_name}", ingredient_alcohol: "#{ingredient_alcohol}")
        end
        measurements.each do |measure|
          measure.each do |measure_key, measure_item|
            if measure_key === key
              Measurement.create(measurement: "#{measure_item}", recipe: recipe, ingredient: ingredient)
            end
          end
        end
      end
    end
  end
end




