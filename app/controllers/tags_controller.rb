class TagsController < ApplicationController
  before_filter :authorize

  def new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = current_user.tags.order(:name)
  end

  def create
    tags = params[:tag][:name]
    tags_array = tags.split(",")
    tags_array.each do |tag|
      if current_user.tags.where(:name => tag).empty?
        @tag = Tag.new
        @tag.user_id = current_user.id
        @tag.group_id = current_user.group.id
        @tag.name = tag
        if params[:contact_id] != nil
        @descriptor = @tag.descriptors.build(:contact_id => params[:contact_id])
        end
        if @tag.save != true
          redirect_to :back, notice: "Sorry, something went wrong. Please try to create your tag again"
        end
      else
        if params[:contact_id] != nil
          @descriptor = Descriptor.new
          @descriptor.contact_id = params[:contact_id]
          @descriptor.tag_id = current_user.tags.where(:name => tag).first.id
          if @descriptor.save != true
            redirect_to :back, notice: "Sorry, something went wrong. Please try to create your tag again"
          end
        else
          redirect_to :back, notice: "The tag '#{tag}' already exists."
          return
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
