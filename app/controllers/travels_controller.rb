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
    @members = Member.joins(:travel).where(travel_id: @travel.id)
    contents = Content.joins(member: :travel).where(member_id: @members.ids)

    amount = contents.map { |content| content.amount}
    @amount = amount.inject {|num, sum| 
    num = sum + num
   }
    @members1 = Member.where(travel_id: @travel)
    
    # raise members.inspect
   
    member3 = @members1.each { |member| 
    @content9 = member.sum_content
   # raise @content.inspect
  } 
 # raise @content9.inspect
  end

  def edit
  end
  

  def create
    @travel = current_user.travels.build(travel_params)
    if @travel.save
      redirect_to @travel
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

  def sum_content
    
  end
end
