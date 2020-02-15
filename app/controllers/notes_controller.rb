# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i[edit update destroy]

  def index
    search = params.has_key?(:search)
    @notes = current_user.notes

    if search
      @search_pattern = params[:search]
      @notes = @notes.search(params[:search])
    end

    @notes = @notes.order(updated_at: :desc)
  end

  def new
    @note = current_user.notes.new
  end

  def edit; end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to root_url, notice: "Note was successfully created."
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to root_url, notice: "Note was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_url, notice: "Note was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = current_user.notes.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :body, :search)
  end
end
