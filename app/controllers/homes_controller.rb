class HomesController < ApplicationController
  def index
    if current_user === true
    @user_id = current_user.id
    end
  end
end
