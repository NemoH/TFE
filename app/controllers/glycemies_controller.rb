class GlycemiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_glycemy, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  respond_to :html
  X_VALUE = 180
  Y_VALUE = 80

  def index
    #@glycemies = Glycemy.all
    @glycemies = Glycemy.search(params[:search]).search2(params[:search2]).where(:user_id => current_user.id).order(sort_column + '  ' + sort_direction).page(params[:page]).per(30)

    respond_with(@glycemies)
  end

  def sort_column
    Glycemy.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
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
    #@glycemy.save
    #@user = current_user
    #@glycemy.set_user!(current_user)
    #@glycemy.user_id = current_user.id
    @glycemy.glycemy_user = current_user
    @glycemy.save_with_a_user
    @glycemy.hyper = true if @glycemy.valeur > X_VALUE
    @glycemy.hypo = true if @glycemy.valeur < Y_VALUE
    @glycemy.save
    respond_with(@glycemy) 
  end

  
  def import
    Glycemy.import(params[:file])

@glycemy.glycemy_user = current_user
    redirect_to root_url, notice: "Glycemies imported."
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
