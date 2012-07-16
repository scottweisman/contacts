class InvitationsController < ApplicationController

  def new
    @group = current_user.group
    @invitation = Invitation.new
  end
  
  def create
    @group = current_user.group
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      InvitationsMailer.group_invitations(@invitation, @group).deliver
      redirect_to contacts_path, notice: "Thank you, your invitation has been sent."
    else
      render :action => "new"
    end
  end

end