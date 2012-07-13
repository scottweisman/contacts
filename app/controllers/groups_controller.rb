class GroupsController < ApplicationController
  def update
    @group = current_user.group
    if @group.update_attributes(params[:group])
      redirect_to edit_user_path(current_user), notice: 'Your information was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
