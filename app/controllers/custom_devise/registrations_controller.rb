class CustomDevise::RegistrationsController < Devise::RegistrationsController

  def create
    @group = Group.new(name: params[:group_name])
    if @group.save
      @user = User.new(params[:user])
      @user.group_id = @group.id
    else
      redirect_to signup_path, notice: "You must submit a company or group name!"
      return
    end
    if @user.save
      sign_in @user
      redirect_to root_url, notice: "Thank you for signing up."
    else
      render action: 'new'
    end
  end
end