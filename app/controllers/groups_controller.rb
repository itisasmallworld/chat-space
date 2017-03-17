class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def index
  end

  def create
    Group.create(group_name: group_params[:group_name])
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:group_name)
  end
end
