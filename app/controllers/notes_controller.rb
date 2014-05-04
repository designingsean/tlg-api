class NotesController < ApplicationController
  def show
    @notes = Notes.select('id,
                            callID,
                            userID,
                            DATE_FORMAT(notesDate, "%Y%m%dT%H%i%s") as notesDate,
                            comments') \
                      .where(:callID => params[:id]) \
                      .order(:notesDate) \
                      .reverse_order
    render json: @notes
  end

  def create
    Notes.create(callID: params[:callID], userID: params[:userID], comments: params[:comments])
  end
end