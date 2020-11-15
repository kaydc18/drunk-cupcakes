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
        render json: {info: "you need to be logged in to save recipes"}
      end
    else
      render json: {info: "this is in your recipe book already", user: @user_id }
    end

  end

  def index
    user_id = current_user.id
    recipes_list = []
    recipe_books = RecipeBook.where(user_id: user_id)
    
    recipe_books.each do |recipe_book|
      recipe_id = recipe_book.recipe_id
      recipes_list << { recipe: Recipe.find(recipe_id), recipe_book_id: recipe_book.id}
    end
   
    @recipe_names = []

    recipes_list.each do |recipe|
      recipe_book_id = recipe[:recipe_book_id]
      recipe_info = recipe[:recipe]
      @recipe_names << {name: recipe_info.drink_name, recipe_image: recipe_info.drink_image, id: recipe_book_id}
    end

    render json: @recipe_names
  end

  def show
   
    @recipe_book = RecipeBook.find(params[:id])
    @recipe_id = @recipe_book.recipe_id
    @recipe = Recipe.find(@recipe_id)

    @name = @recipe.drink_name
    @ingredient_full = []
    @alcohol = []
    @ingredients = []
    @measurements = []
    @measurement_full = Measurement.where(recipe: "#{@recipe_id}")
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