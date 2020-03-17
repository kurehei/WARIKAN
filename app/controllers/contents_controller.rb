class ContentsController < ApplicationController
 before_action :set_member
 before_action :set_travel
 before_action :set_content, only: [ :show, :edit, :update, :destroy]
 before_action :authenticate_user!
  def index
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
    travel = Travel.find(params[:travel_id])
    @members = Member.joins(:travel).where(travel_id: @travel.id)
        # sraise @members.inspect
  end

  def create
    @content =@member.contents.build(content_params)
    raise content_params.inspect
    if @content.save
      flash[:success] = "登録しました"
      redirect_to travel_member_path(@travel, @member)
    else
      raise @content.inspect
      flash[:danger] = "登録できませんでした"
      render "new"
    end
  end

  def destroy
  end

  def edit
    @travel = Travel.find_by(travel: params[:travel_id])
  end

  def update
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def set_travel
    @travel = Travel.find(params[:travel_id])
  end
  
  def set_member
    @member = Member.find(params[:member_id])
  end

  def content_params
    params.require(:content).permit(:member_id, :name, :amount, :body,average_amount: [])
  end
end
