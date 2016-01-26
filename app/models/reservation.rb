class Reservation < ActiveRecord::Base

	belongs_to :listing
	belongs_to :student, class_name:"User"
	belongs_to :landlord, class_name:"User"
	
	validates :name, :nationality, :age, :message, presence: true
end
