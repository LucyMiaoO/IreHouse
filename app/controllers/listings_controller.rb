class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :landlord]
  before_filter :check_user, only: [:edit, :update, :destroy]

  def index
       @listings = Listing.all.order("created_at DESC")
    if params[:group_id]
       @group = Group.find(params[:group_id])
       @listings = @group.listings.paginate(page: params[:page], per_page: 4)
    else
       @listings = Listing.paginate(page: params[:page], per_page: 4)
    end  
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Your house was successfully added.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def landlord
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  private

    def find_listing
      @listing = Listing.find(params[:id])
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:city, :deposit,:rental, :address, :description, :image, :group_id)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Oops, this house information belongs to someone else."
      end
    end
end
