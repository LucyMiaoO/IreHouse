class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @listing = Listing.find(params[:listing_id])
    @landlord = @listing.user

    @reservation.listing_id = @listing.id
    @reservation.student_id = current_user.id
    @reservation.landlord_id = @landlord.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to listings_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def receipts
    @reservations = Reservation.all.where(landlord: current_user).order("created_at DESC")
  end

  def reserves
    @reservations = Reservation.all.where(student: current_user).order("created_at DESC")
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:name, :nationality, :age, :message)
    end
end
