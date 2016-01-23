class Listing < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
  else
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
  end

  validates :city, :description, :deposit, presence: true
  validates :deposit, numericality: { greater_than: 0 }
  validates_attachment_presence :image
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

end