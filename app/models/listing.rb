class Listing < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  has_many :reservations
  
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  else
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  end

  validates :city, :address, :description, :deposit, :rental, presence: true
  validates :deposit, :rental, numericality: { greater_than: 0 }
  validates_attachment_presence :image
  
end