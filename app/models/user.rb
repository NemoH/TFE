class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           # Setup accessible (or protected) attributes for your model
 # attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
	has_many :articles
  has_many :glycemies
	validates :password, presence: true,
	length: {minimum: 8}
	validates :email, presence: true
	validates :username, presence: true
	  def login=(login)
    @login = login
  end

  def self.current
      Thread.current[:user]
  end 

  def self.current=(user)
      Thread.current[:user] = user
  end
  #attr_accessible :email, :password; :password_confirmation, :remember_me, :username
  def login
    @login || self.username || self.email
  end
end
