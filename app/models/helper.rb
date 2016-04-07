class Helper < ActiveRecord::Base

	belongs_to :user
	belongs_to :help

    validates :reply, presence: true
end
