class GlycemiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_glycemy, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index
    #@glycemies = Glycemy.all
    @glycemies = Glycemy.where(:user_id => current_user.id)
    respond_with(@glycemies)

    
  
  end

  def new
    @ask.user_id = current_user.id
  end

  def show

    respond_with(@glycemy)
  end

  def new
    @glycemy = Glycemy.new
    respond_with(@glycemy)
  end

  def edit
  end

  def create
    @glycemy = Glycemy.new(glycemy_params)
    @glycemy.save
    @user = current_user
    @glycemy.set_user!(current_user)
    @glycemy.user_id = current_user.id
    respond_with(@glycemy)
    
  end

  def update
    @glycemy.update(glycemy_params)
    respond_with(@glycemy)
  end

  def destroy
    @glycemy.destroy
    respond_with(@glycemy)
  end

  

  private
    def set_glycemy
      @glycemy = Glycemy.find(params[:id])
    end

    def glycemy_params
      params.require(:glycemy).permit(:valeur, :note, :users_id, :date)
    end
end
