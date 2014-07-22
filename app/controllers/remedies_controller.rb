class RemediesController < ApplicationController
  before_action :set_remedy, only: [:show, :edit, :update, :destroy]

  # GET /remedies
  # GET /remedies.json
  def index
    @remedies =  User.find_by_id(params[:user_id]).remedy
  end

  # GET /remedies/1
  # GET /remedies/1.json
  def show
    @remedy = User.find_by_id(params[:user_id]).remedy.find_by_id(params[:id])
  end

  # GET /remedies/new
  def new
    @user = User.find_by_id(params[:user_id])
    @remedy = @user.remedy.new
  end

  # GET /remedies/1/edit
  def edit
    @user = User.find_by_id(params[:user_id])
    @remedy = @user.remedy.find_by_id(params[:id])
  end

  # POST /remedies
  # POST /remedies.json
  def create
    @remedy = User.find_by_id(params[:user_id]).remedy.create(remedy_params)

    respond_to do |format|
      if @remedy.save
        format.html { redirect_to user_remedies_path(params[:user_id]), notice: 'Remedy was successfully created.' }
        format.json { render :show, status: :created, location: @remedy }
      else
        format.html { render :new }
        format.json { render json: @remedy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remedies/1
  # PATCH/PUT /remedies/1.json
  def update
    @remedy = User.find_by_id(params[:user_id]).remedy.find_by_id(params[:id])

    respond_to do |format|
      if @remedy.update(remedy_params)
        format.html { redirect_to user_remedies_path(params[:user_id]), notice: 'Remedy was successfully updated.' }
        format.json { render :show, status: :ok, location: @remedy }
      else
        format.html { render :edit }
        format.json { render json: @remedy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remedies/1
  # DELETE /remedies/1.json
  def destroy
    @remedy = User.find_by_id(params[:user_id]).remedy.find_by_id(params[:id])
    @remedy.destroy
    
    respond_to do |format|
      format.html { redirect_to user_remedies_url, notice: 'Remedy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remedy
      @remedy = User.find_by_id(params[:user_id]).remedy.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remedy_params
      params.require(:remedy).permit(:quantidade, :name, :user_id)
    end
end
