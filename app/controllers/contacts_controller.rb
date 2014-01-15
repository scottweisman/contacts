class ContactsController < ApplicationController
  before_filter :authorize

  def index
    if params[:template] == "true"
      @contacts = []
      @contacts[0] = Contact.example
    else
      @search_criteria = params[:search]
      @contacts = @search_criteria.blank? ? current_group.contacts.order(:last_name) : contact_search_results
    end
    @contact = Contact.new
    @contact.notes.build
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
    @contact.notes.build
    @contact.tags.build
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_group.contacts.new(params[:contact])
    @contact.user_id = current_user.id
    if @contact.save
      Tag.process_tags(tag_names: params[:tag_names], group: current_group, contact: @contact)
      redirect_to contacts_path, notice: "#{@contact.full_name} was successfully created as a contact."
    else
      render action: "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      redirect_to contacts_path, notice: "#{@contact.full_name} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to root_path, notice: 'Contact was successfully deleted.'
  end

  def import
    Contact.import(params[:file],current_user,current_group)
    redirect_to edit_user_path(current_user), notice: "Contacts were successfully imported."
  end

  def import_from_provider
    @contacts = request.env['omnicontacts.contacts']
    # @contacts.each do |contact|
    #   c = Contact.new
    #   c.first_name = contact[:first_name]
    #   c.last_name = contact[:last_name]
    #   c.email = contact[:email]
    #   c.user_id = current_user.id
    #   c.group_id = current_group.id
    #   c.save
    # end
    # redirect_to contacts_path, :notice => 'Successfully imported gmail contacts.'
  end

  def create_from_import

  end


  private

    def contact_search_results
      current_group.contacts.search_by_contact_info(@search_criteria).order(:last_name) | current_group.contacts.tag_search(@search_criteria).order(:last_name) | current_group.contacts.note_search(@search_criteria).order(:last_name)
    end

end
