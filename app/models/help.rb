class Help < ActiveRecord::Base

	belongs_to :user
    has_many :helpers, dependent: :destroy
  
	validates :title, :city, :message, presence: true

end
