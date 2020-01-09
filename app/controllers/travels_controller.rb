class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @travels = Travel.all
  end

  def new 
    @travel = Travel.new
  end

  def show
    @contents = @travel.contents
  end

  def edit
  end
  

  def create
    @travel = travels.build(travel_params)
    if @travel.save
      redirect_to travels_index_path
    else
      render :new
    end
  end

  def destroy
  end

  def update
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end
  def travel_params
    params.require(:travel).permit(:user_id, :name, :from_date, :to_date, :detail)
  end
end
