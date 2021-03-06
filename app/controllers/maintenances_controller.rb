class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]
  before_action :get_car, only: [:index, :create, :new]

  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = @car.maintenances
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
  end

  # GET /maintenances/new
  def new
    @maintenance = @car.maintenances.build
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = @car.maintenances.build(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, notice: 'Maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def get_car
      @car = Car.find(params[:car_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance)
            .permit(:car_id, :title, :completed_on, :completed_mirage, :description, operations_attributes: [:id, :title, :description])
    end
end
