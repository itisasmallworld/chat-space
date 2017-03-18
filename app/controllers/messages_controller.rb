class MessagesController < ApplicationController

  def index
    @groups = Group.all
    current_user.groups.build
  end
end
