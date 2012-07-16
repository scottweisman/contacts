class ContactsController < ApplicationController
  before_filter :authorize
  before_filter :check_number_of_contacts, :only => :create
  
  def check_number_of_contacts
    if current_user.group.contacts.length == 20
      redirect_to new_subscription_path
    end
  end

  def index
    @contacts = current_group.contacts.order("last_name")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_group.contacts.new(params[:contact])   
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to contacts_path, notice: 'Contact was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        redirect_to @contact, notice: 'Contact was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
  end
end
