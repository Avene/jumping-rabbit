class OperationsController < ApplicationController
  before_action :set_operation, only: [:edit, :update, :destroy]
  before_action :get_maintenance, only: [:index, :create, :new]

  # GET /operations
  # GET /operations.json
  def index
    @operations = @maintenance.operations
  end

  # GET /operations/new
  def new
    @operation = @maintenance.operations.build()
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = @maintenance.operations.build(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /operations/1
  # PATCH/PUT /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation.destroy
    respond_to do |format|
      format.html { redirect_to operations_url, notice: 'Operation was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def get_maintenance
      @maintenance = Maintenance.find(params[:maintenance_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_params
      pp params
      params.require(:operation).permit(:maintenance_id, :title, :description)
    end
end
