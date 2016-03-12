require 'rails_helper'

RSpec.describe BoardsController do

  let(:valid_attributes) {
    {name: "Funny"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  before(:each) do
    @board = Board.create!({name: "Action"})
  end


  describe "GET #index" do
    it "assigns all boards as @boards" do
      get :index
      expect(assigns(:boards)).to eq([@board])
    end
  end

  describe "GET #show" do
    it "assigns the requested board as @board" do
      get :show, {id: @board.id}
      expect(assigns(:board)).to eq(@board)
    end
  end

  describe "GET #new" do
    it "assigns a new board as @board" do
      get :new, {}
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe "GET #edit" do
    it "assigns the requested board as @board" do
      get :edit, {id: @board.id}
      expect(assigns(:board)).to eq(@board)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, {board: valid_attributes}
        }.to change(Board, :count).by(1)
      end

      it "assigns a newly created board as @board" do
        post :create, {board: valid_attributes}
        expect(assigns(:board)).to be_a(Board)
        expect(assigns(:board)).to be_persisted
      end

      it "redirects to the created board" do
        post :create, {board: valid_attributes}
        expect(response).to redirect_to(Board.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved board as @board" do
        post :create, {board: invalid_attributes}
        expect(assigns(:board)).to be_a_new(Board)
      end

      it "re-renders the 'new' template" do
        post :create, {board: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Action"}
      }

      it "updates the requested board" do
        put :update, {id: @board.id, board: new_attributes}
        @board.reload
        expect(@board.name).to eq(new_attributes[:name])
      end

      it "assigns the requested board as @board" do
        put :update, {id: @board.id, board: valid_attributes}
        expect(assigns(:board)).to eq(@board)
      end

      it "redirects to the board" do
        put :update, {id: @board.id, board: valid_attributes}
        expect(response).to redirect_to(@board)
      end
    end

    context "with invalid params" do
      it "assigns the board as @board" do
        put :update, {id: @board.id, board: invalid_attributes}
        expect(assigns(:board)).to eq(@board)
      end

      it "re-renders the 'edit' template" do
        put :update, {id: @board.id, board: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      expect {
        delete :destroy, {id: @board.id}
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      delete :destroy, {id: @board.id}
      expect(response).to redirect_to(boards_url)
    end
  end

  describe "GET #add_video" do
    it "assigns the board as @board" do
      get :add_video, {id: @board.id}
      expect(assigns(:board)).to eq(@board)
    end

    it "assigns all videos that does not belong to the board as @videos" do
      video1 = @board.videos.create!(url: "https://www.youtube.com/watch?v=9bZkp7q19f0")
      video2 = Video.create!(url: "https://www.youtube.com/watch?v=VugtWhufJhI")
      get :add_video, {id: @board.id}
      expect(assigns(:videos)).to eq([video2])
    end
  end

  describe "POST #map_video" do
    it "maps the video to the board" do
      video = Video.create!(url: "https://www.youtube.com/watch?v=VugtWhufJhI")
      expect {
        post :map_video, {id: @board.id, video: video.id}
      }.to change(Grouping, :count).by(1)
    end
  end
end
