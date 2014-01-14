class NotesController < ApplicationController
  before_filter :authorize

  def new
  end

  def create
    if params[:note][:content].length > 0
      @note = Note.new(params[:note])
      @note.contact_id = params[:note][:contact_id]
      @contact = Contact.find_by_id(@note.contact_id)

      respond_to do |format|
        if @note.save
          format.js
          format.html { redirect_to :back, notice: 'Note was successfully added.' }
        else
          redirect_to :back, notice: "Sorry, something went wrong. Please try to create your note again"
        end
      end
    else
      respond_to do |format|
        redirect_to :back
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: 'Note was successfully deleted' }
    end
  end
end
