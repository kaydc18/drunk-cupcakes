require "faraday"

class Search
  def initialize
    @drinks = []
    @ingredients = []
  end

  def retrieve_drinks(query)
    drinks_data = drinks_request(query)
    return @drinks = drinks_data["drinks"]
  end

  def drinks_request(query)
    response = Faraday.get("https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/search.php?s=#{query}")
    return JSON.parse(response.body)
  end

  def retrieve_ingredients(ingredient_query)
    ingredients_data = ingredients_request(ingredient_query)
    return @ingredients = ingredients_data["ingredients"]
  end

  def ingredients_request(ingredient_query)
    response = Faraday.get("https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/search.php?i=#{ingredient_query}")
    return JSON.parse(response.body)
  end
end
