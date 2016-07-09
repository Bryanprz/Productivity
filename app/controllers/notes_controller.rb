class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    @note = Note.new
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    #respond_to do |format|
      if @note.save

        # ActionCable.server.broadcast args:
        # 1. name of channel to which we are broadcasting
        # 2. Some content that will be sent through the channel as JSON
        #      'note:' set to the description of the note we just created
        #      There is nothing special about the 'note' key here. We can structure
        #      or label the data we want to send across the channel any way we like,
        #      as long as we tell our subscriber to access that data in accordance
        #      with how we structure it here.
        #
        # ActionCable uses Redis to send and receive notes over the channel.
        # So when we tell ActionCable server to #broadcast to 'notes', we're actually
        # saying "send new notes to the 'notes' channel maintained by Redis."
        # Redis is the data store that ensures all notes are in sync across instances
        # of the application.

        # This broadcasts the ActiveRecord object @note to the 'notes' channel. Here we're just sending data from the database to the channel. The NotesChannel is responsible for streaming this data to its subscribers.
        ActionCable.server.broadcast 'notes', note: @note.description, id: @note.id
        ActionCable.server.broadcast 'notices', notice: "Note was successfully created. Nice."
        #format.html { redirect_to index, notice: 'Note was successfully created.' }
        #format.json { redirect_to index, status: :created, location: @note }
      #else
        #format.html { render :new }
        #format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.fetch(:note, {}).permit(:description)
    end
end
