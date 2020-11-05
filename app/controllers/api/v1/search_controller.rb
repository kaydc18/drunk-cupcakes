require "faraday"

class Api::V1::SearchController < ApplicationController
  def search
    BASE_URL = "https://www.thecocktaildb.com/api/json/v2/#{ENV['COCKTAIL_DB']}/filter.php?"
    response = Faraday.get("#{BASE_URL}i=#{query_1},#{query_2}")

    JSON.parse(response.body)

    binding.pry
  end
end