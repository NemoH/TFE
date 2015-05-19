class Insuline < ActiveRecord::Base
belongs_to :user

TYPE = ['Novorapid', 'Levemir','Novolog','Humulin R','Lantus']
def set_user!(user)
  	self.user_id = user.id
  	self.save!
 end


end
