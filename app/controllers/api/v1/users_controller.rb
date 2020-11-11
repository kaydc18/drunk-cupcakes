class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_id = @user.id

    render json: @user
  end
end