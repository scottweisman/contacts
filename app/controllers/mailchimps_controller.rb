class MailchimpsController < ApplicationController

  def create
    @mailchimp = Mailchimp.new(params[:mailchimp])
    @mailchimp.group_id = current_user.group.id
    @mailchimp.list_name = params[:list_name]
    @mailchimp.list_id = params[:list_id]
    @mailchimp.subscribe_method = params[:mailchimp][:subscribe_method]
    if @mailchimp.subscribe_method == "tag" && current_user.tags.where(:name => @mailchimp.list_name).count == 0
      @tag = Tag.new
      @tag.user_id = current_user.id
      @tag.name = @mailchimp.list_name
      @tag.save
    end
    if @mailchimp.save
      redirect_to edit_user_path(current_user), :notice => 'Your mailchimp preferences were saved successfully.'
    else
      redirect_to :back, :notice => "We're sorry, but something went wrong when we tried to update your mailchimp preferences."
    end
  end

end
