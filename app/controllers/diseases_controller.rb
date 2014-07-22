class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]

  # GET /diseases
  # GET /diseases.json
  def index
    @diseases = User.find_by_id(params[:user_id]).disease
  end

  # GET /diseases/1
  # GET /diseases/1.json
  def show
    @diseases = User.find_by_id(params[:user_id]).disease.find_by_id(params[:id])
  end

  # GET /diseases/new
  def new
    @user = User.find_by_id(params[:user_id])
    @disease = @user.disease.new
  end

  # GET /diseases/1/edit
  def edit
    @user = User.find_by_id(params[:user_id])
    @disease = @user.disease.find_by_id(params[:id])
  end

  # POST /diseases
  # POST /diseases.json
  def create
    @disease = User.find_by_id(params[:user_id]).disease.create(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to user_diseases_path(params[:user_id]), notice: 'Disease was successfully created.' }
        format.json { render :show, status: :created, location: @disease }
      else
        format.html { render :new }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diseases/1
  # PATCH/PUT /diseases/1.json
  def update
    @disease = User.find_by_id(params[:user_id]).disease.find_by_id(params[:id])

    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to user_diseases_path(params[:user_id]), notice: 'Disease was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease }
      else
        format.html { render :edit }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diseases/1
  # DELETE /diseases/1.json
  def destroy
    @allergy = User.find_by_id(params[:user_id]).disease.find_by_id(params[:id])
    @disease.destroy
    
    respond_to do |format|
      format.html { redirect_to user_diseases_url, notice: 'Disease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disease
      @disease = User.find_by_id(params[:user_id]).disease.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_params
      params.require(:disease).permit(:name, :user_id)
    end
end
