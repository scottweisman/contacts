class TagsController < ApplicationController
  before_filter :authorize

  def new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = current_group.tags.order(:name)
  end

  def create
    contact = Contact.find_by_id(params[:contact_id])
    Tag.process_tags(tag_names: params[:tag_names], group: current_user.group, contact: contact)
    redirect_to :back
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: 'Tag was successfully deleted' }
    end
  end

end
