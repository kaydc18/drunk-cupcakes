class Api::V1::RecipeBooksController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    recipe = Recipe.find(params[:recipe])
    this_user = current_user
    @user_id = current_user.id

    if RecipeBook.where(recipe_id: recipe.id, user_id: this_user.id) === []
      recipe_book = RecipeBook.new()
      recipe_book.recipe = recipe
      recipe_book.user = this_user


      if recipe_book.save
        render json: {info: "this has been added to your recipe book" , user: @user_id }
      else
        render json: {info: recipe_book.errors.full_messages}, status: 400
      end
    else
      render json: {info: "this is in your recipe book already", user: @user_id }
    end

  end

  def index
    recipes = RecipeBook.all
    recipes.each do |info|

    end
    render json: @recipes
  end

end