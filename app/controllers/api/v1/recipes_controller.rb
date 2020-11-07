require "faraday"

class Api::V1::RecipesController < ApplicationController
  # def name_search
  #   name_search = params['search_string']

  #   @BASE_URL = "https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/search.php?"

  #   response = Faraday.get("#{@BASE_URL}s=margarita")

  #   parsed_response = JSON.parse(response)

  #   #need to loop parsed response
  #   #In loop pull name and ID into Recipe.new

  #   binding.pry

  #   Recipe.new(response.body)
  # end

  # def ingredient_search
  #   name_search = params['search_string']

  #   @BASE_URL = "https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/search.php?"

  #   response = Faraday.get("#{@BASE_URL}s=#{name_search}")

  #   Recipe.new(response.body)
  # end

  # def show
  #   recipe_id = Recipe.find(params[:id])

  #   @BASE_URL = "https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/lookup.php?"
    
  #   response = Faraday.get("#{@BASE_URL}i=#{recipe_id}")

  # end
end