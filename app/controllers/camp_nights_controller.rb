class CampNightsController < ApplicationController
  before_action :set_camp_night, only: [:show, :edit, :update, :destroy]

  # GET /camp_nights
  # GET /camp_nights.json
  def index
    @camp_nights = CampNight.all
  end

  # GET /camp_nights/1
  # GET /camp_nights/1.json
  def show
  end

  # GET /camp_nights/new
  def new
    @camp_night = CampNight.new
  end

  # GET /camp_nights/1/edit
  def edit
  end

  # POST /camp_nights
  # POST /camp_nights.json
  def create
    @camp_night = CampNight.new(camp_night_params)

    respond_to do |format|
      if @camp_night.save
        format.html { redirect_to @camp_night, notice: 'Camp night was successfully created.' }
        format.json { render :show, status: :created, location: @camp_night }
      else
        format.html { render :new }
        format.json { render json: @camp_night.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_nights/1
  # PATCH/PUT /camp_nights/1.json
  def update
    respond_to do |format|
      if @camp_night.update(camp_night_params)
        format.html { redirect_to @camp_night, notice: 'Camp night was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp_night }
      else
        format.html { render :edit }
        format.json { render json: @camp_night.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_nights/1
  # DELETE /camp_nights/1.json
  def destroy
    @camp_night.destroy
    respond_to do |format|
      format.html { redirect_to camp_nights_url, notice: 'Camp night was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_night
      @camp_night = CampNight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_night_params
      params.require(:camp_night).permit(:adventure_id, :person_id, :nights)
    end
end
