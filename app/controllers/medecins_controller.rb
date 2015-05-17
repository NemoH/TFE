class MedecinsController < ApplicationController
  before_action :set_medecin, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    #@medecins = Medecin.all
    @medecins = Medecin.where(:user_id => current_user.id)
    respond_with(@medecins)
  end

  def show
    respond_with(@medecin)
  end

   def new
    @ask.user_id = current_user.id
  end

  def new
    @medecin = Medecin.new
    respond_with(@medecin)
  end

  def edit
  end

  def create
    @medecin = Medecin.new(medecin_params)
    @medecin.save
    @user = current_user
    @medecin.set_user!(current_user)
    @medecin.user_id = current_user.id
    respond_with(@medecin)
  end

  def update
    @medecin.update(medecin_params)
    respond_with(@medecin)
  end

  def destroy
    @medecin.destroy
    respond_with(@medecin)
  end

  private
    def set_medecin
      @medecin = Medecin.find(params[:id])
    end

    def medecin_params
      params.require(:medecin).permit(:rdv, :note)
    end
end
