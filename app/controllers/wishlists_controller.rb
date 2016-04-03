class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def new
    @wishlist = Wishlist.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @listing = Listing.find(params[:listing_id])
    @wishlist.listing_id = @listing.id
    @wishlist.user_id = current_user.id

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to listings_path, notice: 'Wishlist was successfully created.' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def wishlists
    @wishlists = Wishlist.all.where(user: current_user).order("created_at DESC")
  end

  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to listings_path, notice: 'Wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private

    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    def wishlist_params
      params.require(:wishlist).permit(:rate)
    end
end
