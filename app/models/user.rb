class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :listings, dependent: :destroy
  has_many :helps, dependent: :destroy
  has_many :receipts, class_name: "Reservation", foreign_key: "landlord_id", dependent: :destroy
  has_many :reserves, class_name: "Reservation", foreign_key: "student_id", dependent: :destroy
  has_many :wishlists, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  
end
