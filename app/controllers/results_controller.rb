class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    #@results = Result.all
    @results = Result.where(:user_id => current_user.id)
    respond_with(@results)
  end

  def show
    respond_with(@result)
  end
   def new
    @ask.user_id = current_user.id
  end
  def new
    @result = Result.new
    respond_with(@result)
  end

  def edit
  end

  def create
    @result = Result.new(result_params)
    @result.save
        @user = current_user
    @result.set_user!(current_user)
    @result.user_id = current_user.id
    respond_with(@result)
  end

  def update
    @result.update(result_params)
    respond_with(@result)
  end

  def destroy
    @result.destroy
    respond_with(@result)
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def result_params
      params.require(:result).permit(:hb, :hb, :note, :date)
    end
end
