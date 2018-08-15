class CatsController < ApplicationController

  before_action :ensure_cat_owner, only:[:edit, :update]
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      user_id  = @cat.owner.id
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end


  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat
      if @cat.update_attributes(cat_params)
        redirect_to cat_url(@cat)
      else
        flash.now[:errors] = @cat.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["Cat not found"]
      redirect_to cats_url
    end
  end

  private

  def ensure_cat_owner
    cat = Cat.find_by(id: params[:id])
    # cat.owner = current_user
    unless current_user.cats.include?(cat)
      flash[:errors] = ["Not the owner!"]
      redirect_to cat_url(cat)
    end
  end

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
