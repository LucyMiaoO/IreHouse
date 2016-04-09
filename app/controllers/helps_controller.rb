class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @helps = Help.all
  end

  def search
    @helps = Help.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @helps }
    end
  end

  def show
  end

  def new
    @help = Help.new
  end

  def edit
  end

  def create
    @help = Help.new(help_params)
    @help.user_id = current_user.id

    respond_to do |format|
      if @help.save
        format.html { redirect_to @help, notice: 'Help was successfully created.' }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to @help, notice: 'Help was successfully updated.' }
        format.json { render :show, status: :ok, location: @help }
      else
        format.html { render :edit }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @help.destroy
    respond_to do |format|
      format.html { redirect_to helps_url, notice: 'Help was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tenant
    @helps = Help.where(user: current_user).order("created_at DESC")
  end

  private
    def set_help
      @help = Help.find(params[:id])
    end

    def help_params
      params.require(:help).permit(:title, :city, :message)
    end
end
