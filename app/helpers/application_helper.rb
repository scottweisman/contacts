module ApplicationHelper
  
  def title 
    base_title = "TinyContacts"
    if @title.nil?
      base_title
    else
      "#{@title}"
    end 
  end

end