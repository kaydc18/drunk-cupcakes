require "faraday"

class Api::V1::RecipesController < ApplicationController
  def name_search
    @name_search = params['search_string'].gsub(" ", "_")

    @recipes = Recipe.where("drink_name ILIKE ?", "%#{@name_search}%")

    if @recipes === []
      query = @name_search
      search = Search.new
      drinks = search.retrieve_drinks(query)

      drinks.each do |drink|
        drink_id = drink["idDrink"]
        drink_name = drink["strDrink"]

        ingredients = []
        measurements = []
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

            ingredients_query = item
            search = Search.new
            ingredients = search.retrieve_ingredients(ingredients_query)
        
            ingredients.each do |ingredient|
              ingredient_id = ingredient["idIngredient"]
              ingredient_name = ingredient["strIngredient"]
              
              if ingredient["strAlcohol"] === "Yes"
                ingredient_alcohol = true
              else
                ingredient_alcohol = false
              end
 
              ingredient = Ingredient.find_or_create_by(ingredient_id: "#{ingredient_id}")

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
      @recipes = Recipe.where("drink_name ILIKE ?", "%#{@name_search}%")
    end

    render json: @recipes
  end

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    recipe_id = @recipe.id
    @name = @recipe.drink_name
    #double check these arrays
    @ingredient_full = []
    @alcohol = []
    @ingredients = []
    @measurements = []

    @measurement_full = Measurement.where(recipe: "#{recipe_id}")
    @measurement_full.each do |measurement|
      @measurements << measurement.measurement
      measurement_id = measurement.ingredient_id
      @ingredient_full << Ingredient.find_by(id: "#{measurement_id}")
    end
    @ingredient_full.each_with_index do |ingredient, ingredient_index|
      @measurements.each_with_index do |measurement, index|
        if ingredient_index === index
          if ingredient.ingredient_alcohol === true
            measurement_num = measurement.gsub("oz", ",").gsub("cl", ",").gsub("shot", ",").gsub("measures", ",")
            @alcohol << "#{measurement_num} #{ingredient.ingredient_name}"
          else
            @ingredients << "#{measurement_num} #{ingredient.ingredient_name}"
          end
        end
      end
    end

    render json: { recipe: @name, alcohol: @alcohol, ingredient: @ingredients }

  end
end