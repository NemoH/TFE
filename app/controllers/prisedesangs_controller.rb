class PrisedesangsController < ApplicationController
  before_action :set_prisedesang, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    #@prisedesangs = Prisedesang.all
    @prisedesangs = Prisedesang.where(:user_id => current_user.id).page(params[:page]).per(10)
    respond_with(@prisedesangs)
  end

  def show
    respond_with(@prisedesang)
  end
   def new
    @ask.user_id = current_user.id
  end

  def new
    @prisedesang = Prisedesang.new
    respond_with(@prisedesang)
  end

  def edit
  end

  def create
    @prisedesang = Prisedesang.new(prisedesang_params)
    @prisedesang.save
        @user = current_user
    @prisedesang.set_user!(current_user)
    @prisedesang.user_id = current_user.id
    respond_with(@prisedesang)
  end

  def update
    @prisedesang.update(prisedesang_params)
    respond_with(@prisedesang)
  end

  def destroy
    @prisedesang.destroy
    respond_with(@prisedesang)
  end

  private
    def set_prisedesang
      @prisedesang = Prisedesang.find(params[:id])
    end

    def prisedesang_params
      params.require(:prisedesang).permit(:rdv, :note)
    end
end
