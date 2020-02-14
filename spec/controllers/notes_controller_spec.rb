# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Note. As you add validations to Note, be sure to
  # adjust the attributes here as well.
  let(:note) { create(:note) }
  let(:valid_attributes) { attributes_for :note }
  let(:invalid_attributes) { attributes_for(:note, title: Faker::String.random(length: 40)) }
  let(:user) { create(:user) }

  before { session[:user_id] = user.id }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "does not route" do
      expect(get: "/notes/#{note.id}").not_to be_routable
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: note.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Note" do
        expect { post :create, params: {note: valid_attributes} }.to change(Note, :count).by(1)
      end

      it "redirects to the created note" do
        post :create, params: {note: valid_attributes}
        expect(response).to redirect_to(notes_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {note: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_title) { "This is a new title" }

      it "updates the requested note" do
        put :update, params: {id: note.to_param, note: {title: new_title}}
        note.reload
        expect(note.title).to eq new_title
      end

      it "redirects to the note" do
        put :update, params: {id: note.to_param, note: valid_attributes}
        expect(response).to redirect_to(notes_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: note.to_param, note: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested note" do
      note = create(:note)
      expect { delete :destroy, params: {id: note.to_param} }.to change(Note, :count).by(-1)
    end

    it "redirects to the notes list" do
      delete :destroy, params: {id: note.to_param}
      expect(response).to redirect_to(notes_url)
    end
  end
end
