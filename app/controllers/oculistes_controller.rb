class OculistesController < ApplicationController
  before_action :set_oculiste, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    #@oculistes = Oculiste.all
    @oculistes = Oculiste.where(:user_id => current_user.id)
    respond_with(@oculistes)
  end

  def show
    respond_with(@oculiste)
  end

   def new
    @ask.user_id = current_user.id
  end
  def new
    @oculiste = Oculiste.new
    respond_with(@oculiste)
  end

  def edit
  end

  def create
    @oculiste = Oculiste.new(oculiste_params)
    @oculiste.save
        @user = current_user
    @oculiste.set_user!(current_user)
    @oculiste.user_id = current_user.id
    respond_with(@oculiste)
  end

  def update
    @oculiste.update(oculiste_params)
    respond_with(@oculiste)
  end

  def destroy
    @oculiste.destroy
    respond_with(@oculiste)
  end

  private
    def set_oculiste
      @oculiste = Oculiste.find(params[:id])
    end

    def oculiste_params
      params.require(:oculiste).permit(:rdv, :note)
    end
end
