class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url

  validates :description, presence: true
  validates :user_id, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}  
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

 #find more validations by searching "rails_validations" on Google

 belongs_to :user
 
def pin_params
	params.require(:pin).permit(:description, :image)
end

 #look for relationships of pin-user at "rails_assosications" on rails guides

def image_remote_url=(url_value)
	self.image = URI.parse(url_value) unless url_value.blank?
	super
end
end
