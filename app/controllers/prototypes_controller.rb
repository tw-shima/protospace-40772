class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]
  before_action :check_owner, only: [:edit, :destroy] 
  before_action :move_to_index, only: [:new, :edit, :destroy]

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render "prototypes/edit"
    end
  end
  

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def check_owner
    redirect_to root_path unless @prototype.user == current_user
  end

end

