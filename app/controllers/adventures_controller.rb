class AdventuresController < ApplicationController
  load_and_authorize_resource

  before_action :set_adventure, only: [:show, :edit, :update, :destroy]

  # GET /adventures
  # GET /adventures.json
  def index
    @adventures = Adventure.all
  end

  # GET /adventures/1
  # GET /adventures/1.json
  def show
  end

  # GET /adventures/new
  def new
    @adventure = Adventure.new
  end

  # GET /adventures/1/edit
  def edit
  end

  # POST /adventures
  # POST /adventures.json
  def create
    @adventure = Adventure.new(adventure_params)

    nights = @adventure.nights
    @adventure.people.each do |person|
      @adventure.camp_nights.new(person: person, nights: nights)
    end

    respond_to do |format|
      if @adventure.save
        format.html { redirect_to @adventure, notice: 'Adventure was successfully created.' }
        format.json { render :show, status: :created, location: @adventure }
      else
        format.html { render :new }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventures/1
  # PATCH/PUT /adventures/1.json
  def update
    old_nights = @adventure.nights

    @adventure.assign_attributes(adventure_params)

    nights = @adventure.nights
    @adventure.people.each do |person|
      camp_nights = @adventure.camp_nights.find_by(person: person)
      if camp_nights == nil
        @adventure.camp_nights.new(person: person, nights: nights)
      else
        if camp_nights.nights == old_nights
          camp_nights.nights = nights
        end
      end
    end

    @adventure.camp_nights.each do |camp_night|
      unless @adventure.people.exists? camp_night.person
        camp_night.destroy
      end
    end

    respond_to do |format|
      if @adventure.save
        format.html { redirect_to @adventure, notice: 'Adventure was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventure }
      else
        format.html { render :edit }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventures/1
  # DELETE /adventures/1.json
  def destroy
    @adventure.destroy
    respond_to do |format|
      format.html { redirect_to adventures_url, notice: 'Adventure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventure_params
      params.require(:adventure).permit(:name, :start, :end, :photo_album_id, :post_id, person_ids: [] )
    end
end
