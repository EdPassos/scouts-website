class PhotoAlbumsController < ApplicationController
  before_action :set_photo_album, only: [:show, :edit, :update, :destroy, :newphoto]

  # GET /photo_albums
  # GET /photo_albums.json
  def index
    @photo_albums = PhotoAlbum.all
  end

  # GET /photo_albums/1
  # GET /photo_albums/1.json
  def show
  end

  # GET /photo_albums/new
  def new
    @photo_album = PhotoAlbum.new
  end

  # GET /photo_albums/1/edit
  def edit
  end

  # POST /photo_albums
  # POST /photo_albums.json
  def create
    @photo_album = PhotoAlbum.new(photo_album_params)

    respond_to do |format|
      if @photo_album.save
        format.html { redirect_to @photo_album, notice: 'Photo album was successfully created.' }
        format.json { render :show, status: :created, location: @photo_album }
      else
        format.html { render :new }
        format.json { render json: @photo_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_albums/1
  # PATCH/PUT /photo_albums/1.json
  def update
    respond_to do |format|
      if @photo_album.update(photo_album_params)
        format.html { redirect_to @photo_album, notice: 'Photo album was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_album }
      else
        format.html { render :edit }
        format.json { render json: @photo_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_albums/1
  # DELETE /photo_albums/1.json
  def destroy
    @photo_album.destroy
    respond_to do |format|
      format.html { redirect_to photo_albums_url, notice: 'Photo album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def newphoto
    @photo_album.photos.new(file: params[:file])
    unless @photo_album.save
       render json: @photo_album.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_album
      @photo_album = PhotoAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_album_params
      params.require(:photo_album).permit(:name, :start, :end)
    end
end
