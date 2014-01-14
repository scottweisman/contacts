class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @invitation = Invitation.find_by_recipient_email(params[:user][:email])
    if @invitation.present?
      @group = Group.find_by_id(@invitation.sender.group_id)
      @user.admin = false
    else
      @group = Group.new
      @group.name = params[:user][:group_name]
      @group.save
      @user.admin = true
    end
    @user.group_id = @group.id
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render action: "new"
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
    @user.first_name = @invitation.recipient_first_name
    @user.last_name = @invitation.recipient_last_name
    @user.group_id = @sender.group_id
    @user.invitation_id = @invitation.id
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up."
    else
      render action: 'new'
    end
  end

  def edit
    @user = current_user
    @group = current_user.group
    @invitation = Invitation.new
  end

  def update
    @user = current_user
    @group = current_user.group
    @invitation = Invitation.new
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path, notice: 'Your information was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
