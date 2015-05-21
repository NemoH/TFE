class InsulinesController < ApplicationController
  before_action :set_insuline, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    #@insulines = Insuline.all
    @insulines = Insuline.where(:user_id => current_user.id).page(params[:page]).per(10)
    respond_with(@insulines)
  end

  def show
    respond_with(@insuline)
  end

  def new
    @ask.user_id = current_user.id
  end
  
  def new
    @insuline = Insuline.new
    respond_with(@insuline)
  end

  def edit
  end

  def create
    @insuline = Insuline.new(insuline_params)
    @insuline.save
    @user = current_user
    @insuline.set_user!(current_user)
    @insuline.user_id = current_user.id
    respond_with(@insuline)
  end

  def update
    @insuline.update(insuline_params)
    respond_with(@insuline)
  end

  def destroy
    @insuline.destroy
    respond_with(@insuline)
  end

  private
    def set_insuline
      @insuline = Insuline.find(params[:id])
    end

    def insuline_params
      params.require(:insuline).permit(:name, :unit, :date, :note, :users_id)
    end
end
