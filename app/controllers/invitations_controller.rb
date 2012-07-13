class InvitationsController < ApplicationController

  def new
    @firm = current_user.group
    @invitation = Invitation.new
  end
  
  def create
    @group = current_user.group
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      InvitationsMailer.firm_invitations(@invitation, @group).deliver
      redirect_to kases_url, notice: "Thank you, your invitations have been sent."
    else
      render :new
    end
  end

end