class NotesController < ApplicationController
  
  validates :comment, presence: true

  before_action :user_must_be_signed_in

  def new
    @note = Note.new
  end


  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    redirect_to track_url(@note.track)
  end




  private
  def note_params
    params.require(:note).permit(:user_id, :track_id, :comment)
  end

end
