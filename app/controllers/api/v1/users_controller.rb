class Api::V1::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @user_id = @user.id

    render json: @user
  end
end