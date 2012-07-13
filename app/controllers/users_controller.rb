class UsersController < ApplicationController  
  def new
    @user = User.new
  end

  def create
    @group = Group.new(name: params[:group_name])
      if @group.save
        @user = User.new(params[:user])
        @user.group_id = @group.id
      else
        render "new", notice: "You must submit a company or group name!"
        return
      end
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Thank you for signing up!"
      else
        render "new"
    end
  end
  
  def accept
    @invitation = Invitation.find_by_token(params[:invitation_token])
    @user = User.new
  end
  
  def create_from_invitation
    @invitation = Invitation.find_by_token(params[:invitation_token])
    @sender = @invitation.sender
    @user = User.new(params[:user])
    @user.email = @invitation.recipient_email
    @user.group_id = @sender.group_id
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up."
    else
      render action: 'new'
    end
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: 'Your information was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
