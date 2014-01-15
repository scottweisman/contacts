class MailchimpsController < ApplicationController

  def create
    @mailchimp = Mailchimp.new(params[:mailchimp])
    @mailchimp.group_id = current_user.group.id
    if @mailchimp.save
      redirect_to edit_user_path(current_user), :notice => 'Your Mailchimp preferences were saved successfully.'
    else
      redirect_to :back, :notice => "We're sorry, but something went wrong when we tried to update your Mailchimp preferences."
    end
  end

  def update
    @mailchimp = Mailchimp.find_by_id(params[:id])

    if @mailchimp.update_attributes(params[:mailchimp])
      redirect_to edit_user_path(current_user), notice: "Your Mailchimp settings were successfully updated."
    else
      redirect_to :back, :notice => "We're sorry, but something went wrong when we tried to update your Mailchimp preferences."
    end
  end

end
