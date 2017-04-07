class UsersController < ApplicationController

  def search
    @users = []
    @users = User.search_with_name(params[:name])
    respond_to do |format|
      format.json
    end
  end
end
