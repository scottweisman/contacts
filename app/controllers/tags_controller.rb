class TagsController < ApplicationController
  before_filter :authorize

  def new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tags = params[:tag][:name]
    tags_array = tags.split(",")
    tags_array.each do |tag|
      if current_user.tags.where(:name => tag).empty?
        @tag = Tag.new
        @tag.user_id = current_user.id
        @tag.name = tag
        @descriptor = @tag.descriptors.build(:contact_id => params[:contact_id])
        if @tag.save != true
          redirect_to :back, notice: "Sorry, something went wrong. Please try to create your tag again"
        end
      else
        @descriptor = Descriptor.new
        @descriptor.contact_id = params[:contact_id]
        @descriptor.tag_id = current_user.tags.where(:name => tag).first.id
        if @descriptor.save != true
          redirect_to :back, notice: "Sorry, something went wrong. Please try to create your tag again"
        end
      end
    end
    redirect_to :back, notice: 'Tag was successfully added.'
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