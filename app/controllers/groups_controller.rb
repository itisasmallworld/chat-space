class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    current_user.groups.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "新規のグループが作成されました"
      redirect_to root_path
    else
      flash[:alert] = "新規のグループが作成されませんでした"
      render :new
    end
    
  end

  private
  def group_params
    params.require(:group).permit(:group_name)
  end
end
