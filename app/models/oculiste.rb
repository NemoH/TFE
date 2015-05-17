class Oculiste < ActiveRecord::Base
belongs_to :user

def set_user!(user)
  	self.user_id = user.id
  	self.save!
 end
end
