class PagesController < ApplicationController

  def home
    redirect_to "/contacts" if current_user        
    @title = "TinyContacts | Simple Contact Management for Small Groups"
    @description = "TinyContacts is the easiest way for small companies or groups to share and manage contacts."
  end
  
  def about
    
  end

end