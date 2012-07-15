class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :current_group, :current_contact
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to signin_url if current_user.nil?
  end
  
  def current_group
    current_user.group
  end
  
  def current_contact
    @current_contact ||= if params[:contact_id]
      Contact.find_by_id(params[:contact_id])
    else
      Contact.find_by_id(params[:id])
    end
  end
  
end
