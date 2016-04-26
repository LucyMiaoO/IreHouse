class HelpersController < ApplicationController
  before_action :set_helper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @helper = Helper.new
    @help = Help.find(params[:help_id])
    @helper.help_id = @help.id
    @helper.user_id = current_user.id
    @helpers = Helper.where(help_id: @help.id)
  end


  def create
    @helper = Helper.new(helper_params)
    @help = Help.find(params[:help_id])
    @helper = @help.helpers.new(helper_params)
    @helper.help_id = @help.id
    @helper.user_id = current_user.id

    respond_to do |format|
      if @helper.save
        format.html { redirect_to new_help_helper_path(@help), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @helper }
      else
        format.html { render :new }
        format.json { render json: @helper.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @help = helper.help
    @helper.destroy
    respond_to do |format|
      format.html { redirect_to new_help_helper_path, notice: 'Helper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_helper
      @helper = Helper.find(params[:id])
    end

    def helper_params
      params.require(:helper).permit(:reply)
    end
end
