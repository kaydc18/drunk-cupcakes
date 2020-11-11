class HomesController < ApplicationController
  def index
    current_user
    if current_user == true
    @user_id = current_user.id
    end
  end
end
