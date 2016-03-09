require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  let(:valid_attributes) {
    {url: "https://www.youtube.com/watch?v=9bZkp7q19f0"}
  }

  let(:invalid_attributes) {
    {url: 'abcdefgh'}
  }

  describe "GET #index" do
    it "assigns all videos as @videos" do
      video = Video.create! valid_attributes
      get :index
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe "GET #show" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :show, {id: video.id}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "GET #new" do
    it "assigns a new video as @video" do
      get :new
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

  describe "GET #edit" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :edit, {id: video.id}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Video" do
        expect {
          post :create, {video: valid_attributes}
        }.to change(Video, :count).by(1)
      end

      it "assigns a newly created video as @video" do
        post :create, {video: valid_attributes}
        expect(assigns(:video)).to be_a(Video)
        expect(assigns(:video)).to be_persisted
        expect(assigns(:video).url).to eq(valid_attributes[:url])
      end

      it "redirects to the created video" do
        post :create, {video: valid_attributes}
        expect(response).to redirect_to(Video.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved video as @video" do
        post :create, {video: invalid_attributes}
        expect(assigns(:video)).to be_a_new(Video)
      end

      it "re-renders the 'new' template" do
        post :create, {video: invalid_attributes}
        expect(response).to render_template("new")
      end

      it "should add errors to @video.errors array" do
        post :create, {video: invalid_attributes}
        expect(assigns(:video).errors.to_a.empty?).to be_falsey
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {url: "https://www.youtube.com/watch?v=yMmrDpsYr0s"}
      }

      it "updates the requested video" do
        video = Video.create! valid_attributes
        put :update, {id: video.id, video: new_attributes}
        video.reload
        expect(video.url).to eq(new_attributes[:url])
      end

      it "assigns the requested video as @video" do
        video = Video.create! valid_attributes
        put :update, {id: video.id, video: valid_attributes}
        expect(assigns(:video)).to eq(video)
      end

      it "redirects to the video" do
        video = Video.create! valid_attributes
        put :update, {id: video.id, video: valid_attributes}
        expect(response).to redirect_to(video)
      end
    end

    context "with invalid params" do
      it "assigns the video as @video" do
        video = Video.create! valid_attributes
        put :update, {id: video.id, video: invalid_attributes}
        expect(assigns(:video)).to eq(video)
      end

      it "re-renders the 'edit' template" do
        video = Video.create! valid_attributes
        put :update, {id: video.id, video: invalid_attributes}
        expect(response).to render_template("edit")
      end

      it "should add errors to @video.errors array" do
        post :create, {video: invalid_attributes}
        expect(assigns(:video).errors.to_a.empty?).to be_falsey
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested video" do
      video = Video.create! valid_attributes
      expect {
        delete :destroy, {id: video.id}
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the videos list" do
      video = Video.create! valid_attributes
      delete :destroy, {id: video.id}
      expect(response).to redirect_to(videos_url)
    end
  end

end
