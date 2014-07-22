class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show, :edit, :update, :destroy]

  # GET /allergies
  # GET /allergies.json
  def index
    @allergies =  User.find_by_id(params[:user_id]).allergy
  end

  # GET /allergies/1
  # GET /allergies/1.json
  def show
    @allergy = User.find_by_id(params[:user_id]).allergy.find_by_id(params[:id])
  end

  # GET /allergies/new
  def new
    @user = User.find_by_id(params[:user_id])
    @allergy = @user.allergy.new
  end

  # GET /allergies/1/edit
  def edit
    @user = User.find_by_id(params[:user_id])
    @allergy = @user.allergy.find_by_id(params[:id])
  end

  # POST /allergies
  # POST /allergies.json
  def create
    
    @allergy = User.find_by_id(params[:user_id]).allergy.create(allergy_params)

    respond_to do |format|
      if @allergy.save
        format.html { redirect_to user_allergies_path(params[:user_id]), notice: 'Allergy was successfully created.' }
        format.json { render :show, status: :created, location: @allergy }
      else
        format.html { render :new }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergies/1
  # PATCH/PUT /allergies/1.json
  def update
    @allergy = User.find_by_id(params[:user_id]).allergy.find_by_id(params[:id])

    respond_to do |format|
      if @allergy.update(allergy_params)
        format.html { redirect_to user_allergies_path(params[:user_id]), notice: 'Allergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergy }
      else
        format.html { render :edit }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergies/1
  # DELETE /allergies/1.json
  def destroy
    @allergy = User.find_by_id(params[:user_id]).allergy.find_by_id(params[:id])
    @allergy.destroy

    respond_to do |format|
      format.html { redirect_to user_allergies_path(params[:user_id]), notice: 'Allergy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergy
      @allergy = User.find_by_id(params[:user_id]).allergy.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergy_params
      params.require(:allergy).permit(:name, :user_id)
    end
end
