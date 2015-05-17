class WelcomeController < ApplicationController
  def index
  	
  end
  def show
  	@glycemies = Glycemy.all 
  end
end
