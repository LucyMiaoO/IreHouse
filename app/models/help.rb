class Help < ActiveRecord::Base

	belongs_to :user
    has_many :helpers
  
	validates :title, :city, :message, presence: true

	searchable do
      text :city
    end

end
