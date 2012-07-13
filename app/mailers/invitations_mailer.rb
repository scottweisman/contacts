class InvitationsMailer < ActionMailer::Base
  default from: "support@tinycontacts.com"
  
  def group_invitations(invitation, group_id)
    @group = Group.find(group_id)
    @accept_url = accept_url(invitation.token)
    mail(
      to: invitation.recipient_email, 
      subject: "You have been invited to TinyContacts"
      )
  end
  
end
