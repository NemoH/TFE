class GraphsController < ApplicationController
  before_filter :authenticate_user!
  def hello
  end


  def index
    #@glycemies = Glycemy.all
    @glycemies = Glycemy.where(:user_id => current_user.id)
    respond_with(@glycemies)
  end

  def new
    @ask.user_id = current_user.id
  end

  #def inthezone
  #	render json: Glycemy.where(:user_id => current_user.id).group(:hypo).count
  #end
end
