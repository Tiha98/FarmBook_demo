class CowsController < ApplicationController
  before_action :set_cow, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /cows or /cows.json
  def index
    @cows = current_user.cows.all
    @q = Cow.ransack(params[:q])
  end

  # GET /cows/1 or /cows/1.json
  def show
    @noteable = @cow
    @notes = @cow.notes.order(created_at: :desc)
  end

  # GET /cows/new
  def new
    @cow = Cow.new(user_id: current_user.id)
  end
  # GET /cows/1/edit
  def edit
  end

  # POST /cows or /cows.json
  def create
    @cow = Cow.new(cow_params)
    @cow.user = current_user
    respond_to do |format|
      if @cow.save
        format.html { redirect_to cow_url(@cow), notice: "Cow was successfully created." }
        format.json { render :show, status: :created, location: @cow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cows/1 or /cows/1.json
  def update
    respond_to do |format|
      if @cow.update(cow_params)
        format.html { redirect_to cow_url(@cow), notice: "Cow data's was successfully updated." }
        format.json { render :show, status: :ok, location: @cow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cows/1 or /cows/1.json
  def destroy
    @cow.destroy!

    respond_to do |format|
      format.html { redirect_to cows_url, notice: "Cow data's was successfully added to database." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cow
      @cow = Cow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cow_params
      params.require(:cow).permit(:identificationnumber, :breed, :lactationstatus, :lastcalvingdate, :pregnancystatus, :fathersementype, :approxcalving)
    end
end
