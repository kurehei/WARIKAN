class MembersController < ApplicationController
  before_action :set_member, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
  end

  def show
    @travel = @member.travel
    @contents = @member.contents
  end

  def new
    @member = Member.new
  end

  def create
    current_user.travels.each do |travel|
      @content = travel.members.build(member_params)
     end
     if @content.save
       flash[:success] = "登録しました"
       redirect_to root_path
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
end
