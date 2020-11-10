class Api::V1::RecipeBooksController < ApplicationController

  def create
    recipe = Recipe.find(params[:id])
    recipe_book = RecipeBook.new()
    recipe_book.recipe = recipe
    recipe_book.user = current_user

    if recipe_book.save
      render json: {recipes: recipe_book}
    else
      render json: {error: recipe_book.errors.full_messages}, status: 400
    end
  end

  def index
    @recipes = RecipeBook.all
    render json: @recipes
  end

end