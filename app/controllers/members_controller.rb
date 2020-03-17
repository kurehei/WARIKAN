class MembersController < ApplicationController
  before_action :set_member, only: [ :show, :edit, :update, :destroy]
  before_action :set_travel
  before_action :authenticate_user!
  def index
  end

  def show
    @contents = @member.contents
    amount = @contents.map { |content| content.amount}
    @amount_sum = amount.inject {|num, sum| num = sum + num }
    @contents = Content.joins(member: :travel).merge(Member.where(id: @member.id, travel_id: @travel.id))
     # raise @contents.inspect
    @contents.each do |content| 
      #raise content.inspect 
      @result = content.amount / content.average_amount.length
      
    end
     # raise @result.inspect
  end

  def new
    @member = Member.new
  end

  def create
      @content = @travel.members.build(member_params)    
     if @content.save
       flash[:success] = "登録しました"
       redirect_to travel_path(@travel)
     else
       raise @content.inspect
       flash[:danger] = "登録できませんでした"
       render "new"
     end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end
  def member_params
    params.require(:member).permit(:travel_id, :name)
  end

  def set_travel
    @travel = Travel.find(params[:travel_id])
  end
end
