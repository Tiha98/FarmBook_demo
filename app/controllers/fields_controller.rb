class FieldsController < ApplicationController
  before_action :set_field, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /fields or /fields.json
  def index
    @fields = current_user.fields.all
  end

  # GET /fields/1 or /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields or /fields.json
  def create
    @field = Field.new(field_params)
    @field.user = current_user
    respond_to do |format|
      if @field.save
        format.html { redirect_to field_url(@field), notice: "Field was successfully created." }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to field_url(@field), notice: "Field was successfully updated." }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1 or /fields/1.json
  def destroy
    @field.destroy!

    respond_to do |format|
      format.html { redirect_to fields_url, notice: "Field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_params
      params.require(:field).permit(:name, :location_name, :location_latitude, :location_longitude, :current_crop, :sowing_date, :harvest_date, :size, :fertilizer, :fertilizer_type, :fertilizer_usage, :leased, :leasing_end_date)
    end
end
