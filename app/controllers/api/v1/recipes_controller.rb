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
        drink_image = drink["strDrinkThumb"]

        recipe = Recipe.create(drink_id: "#{drink_id}", drink_name: "#{drink_name}", drink_image: "#{drink_image}")

        sort_ingredient = SortIngredient.new
        ingredients = sort_ingredient.ingredients_sort(drink)
        measurements = sort_ingredient.measurements_sort(drink)

        ingredients.each do |ingredient|
          ingredient.each do |key, item|
            ingredients_query = item
            search = Search.new
            ingredients_new_query = search.retrieve_ingredients(ingredients_query)
        
            ingredients_new_query.each do |ingredient|
              ingredient_id = ingredient["idIngredient"]
              @ingredient_name = ingredient["strIngredient"]
              
              if ingredient["strAlcohol"] === "Yes"
                @ingredient_alcohol = true
              else
                @ingredient_alcohol = false
              end
 
              ingredient_new = Ingredient.where(ingredient_id: "#{ingredient_id}").first_or_create do |ingredient_new|
                  ingredient_new.ingredient_name = @ingredient_name
                  ingredient_new.ingredient_alcohol = @ingredient_alcohol
              end

              measurements.each do |measure|
                measure.each do |measure_key, measure_item|
                  if measure_key === key
                    Measurement.create(measurement: "#{measure_item}", recipe: recipe, ingredient: ingredient_new)
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
    name = @recipe.drink_name

    @measurements = []
    ingredient_search = []
    @alcohol_ingredients = []
    @non_alcohol_ingredients = []

    measurement_search = Measurement.where(recipe: "#{recipe_id}")

    measurement_search.each do |measurement|
      @measurements << measurement.measurement
      measurement_id = measurement.ingredient_id
      ingredient_search << Ingredient.find_by(id: "#{measurement_id}")
    end

    ingredient_search.each_with_index do |ingredient, ingredient_index|
      @measurements.each_with_index do |measurement, measurement_index|
        if ingredient_index === measurement_index
          if ingredient.ingredient_alcohol === true
            measurement_num = measurement.gsub("oz", ",").gsub("cl", ",").gsub("shot", ",").gsub("measures", ",")
            @alcohol_ingredients << "#{measurement_num} #{ingredient.ingredient_name}"
          else
            @non_alcohol_ingredients << "#{measurement_num} #{ingredient.ingredient_name}"
          end
        end
      end
    end

    render json: { recipe: name, alcohol: @alcohol_ingredients, ingredient: @non_alcohol_ingredients }

  end
end