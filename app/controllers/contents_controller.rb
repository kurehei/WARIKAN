class ContentsController < ApplicationController
 before_action :set_content, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    @content = Content.new

    @travel = Content.find_by(travel: params[:travel_id])
  end

  def create
    current_user.travels.each do |travel|
     @content = travel.contents.build(content_params)
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

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end
  

  def content_params
    params.require(:content).permit(:travel_id, :name, :amount, :body)
  end
end
