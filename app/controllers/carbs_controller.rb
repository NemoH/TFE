class CarbsController < ApplicationController
  before_action :set_carb, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!
  respond_to :html

  def index
    @carbs = Carb.where(:user_id => current_user.id).page(params[:page]).per(30)

    #@carbs = Carb.all
    respond_with(@carbs)
  end
  def new
    @ask.user_id = current_user.id
  end

  def show
    respond_with(@carb)
  end

  def new
    @carb = Carb.new
    respond_with(@carb)
  end

  def edit
  end

  def create
    @carb = Carb.new(carb_params)
    @user = current_user
    @carb.set_user!(current_user)
    @carb.user_id = current_user.id
    @carb.save
    respond_with(@carb)
  end

  def update
    @carb.update(carb_params)
    respond_with(@carb)
  end

  def destroy
    @carb.destroy
    respond_with(@carb)
  end

  private
    def set_carb
      @carb = Carb.find(params[:id])
    end

    def carb_params
      params.require(:carb).permit(:valeur, :note, :date)
    end
end
