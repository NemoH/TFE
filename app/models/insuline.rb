class Insuline < ActiveRecord::Base
belongs_to :user
validates :valeur, presence: true,
			length: {maximum: 4},
			inclusion: {in: 0..80}
TYPE = ['Novorapid', 'Levemir','Novolog','Humulin R','Lantus']
def set_user!(user)
  	self.user_id = user.id
  	self.save!
 end


end
