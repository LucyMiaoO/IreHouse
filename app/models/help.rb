class Help < ActiveRecord::Base

	belongs_to :user

	validates :title, :city, :message, presence: true
end
