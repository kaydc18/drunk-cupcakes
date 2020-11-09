require "faraday"

class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    recipe_id = @recipe.id
    @name = @recipe.drink_name
    @ingredient_full = []
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
        @ingredients << {name: ingredient.ingredient_name, alcohol: ingredient.ingredient_alcohol, measurement: measurement}
        end
      end
    end

    render json: { recipe: @name, ingredient: @ingredients }

  end
end