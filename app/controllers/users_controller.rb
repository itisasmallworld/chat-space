class UsersController < ApplicationController

  def user_list_ajax
    @users = []
    @user = User.where("name like ?","%#{params[:name]}%")
    respond_to do |format|
      format.json
    end
  end
end
