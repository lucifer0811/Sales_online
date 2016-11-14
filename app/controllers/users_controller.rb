class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  private
  def users_params
    params.require(:user).permit :name, :email, :birth_day, :avatar
  end
end
