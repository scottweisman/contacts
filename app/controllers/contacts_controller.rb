class ContactsController < ApplicationController
  before_filter :authorize
  before_filter :check_number_of_contacts, :only => :create

  def check_number_of_contacts
    if current_user.plan_id.nil?
      if current_user.group.contacts.length == 1000
        redirect_to new_subscription_path
      end
    end
  end

  def index
    @contacts = current_group.contacts.order(:last_name)
    @contact = Contact.new
    1.times { @contact.notes.build }
    respond_to do |format|
      format.html
      format.csv { render csv: @contacts }
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    1.times { @contact.notes.build }
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_group.contacts.new(params[:contact])
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to contacts_path, notice: "#{@contact.first_name} #{@contact.last_name} was successfully created as a contact."
    else
      render action: "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      redirect_to contacts_path, notice: "#{@contact.first_name} #{@contact.last_name} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to root_path, notice: 'Contact was successfully deleted.'
  end
end
