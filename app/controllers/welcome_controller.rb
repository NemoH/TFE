class WelcomeController < ApplicationController
  def index
  	
  end
  def admin?
    self.admin == true
  end
  def show
  	@glycemies = Glycemy.all 
  end
end
