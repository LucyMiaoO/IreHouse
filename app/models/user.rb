class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :listings, dependent: :destroy
  has_many :helps, dependent: :destroy
  has_many :helpers, dependent: :destroy
  has_many :receipts, class_name: "Reservation", foreign_key: "landlord_id"
  has_many :reserves, class_name: "Reservation", foreign_key: "student_id"
  has_many :wishlists, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
  
end
