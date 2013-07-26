class Pin < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true

 #find more validations by searching "rails_validations" on Google

 belongs_to :user

 #look for relationships of pin-user at "rails_assosications" on rails guides

 validates :user_id, presence: true
end
