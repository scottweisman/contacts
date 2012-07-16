class NotesController < ApplicationController
  before_filter :authorize
  
  def new
  end
  
  def create
    @note = Note.new(params[:note])   
    @note.contact_id = params[:note][:contact_id]
    if @note.save
      redirect_to :back, notice: 'Note was successfully created.'
    else
      redirect_to :back, notice: "Sorry, something went wrong. Please try to create your note again"
    end
  end
end
