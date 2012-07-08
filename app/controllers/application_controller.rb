class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_group, :current_contact
  
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
