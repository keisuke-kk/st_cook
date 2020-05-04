class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @categories = Category.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to category_path(category.id)
  end

  def show
    @menus = @category.menus.includes(:user)
    # @menu = Menu.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.menus.destroy
    category.destroy
    redirect_to root_path
  end

  def random
    menu = Menu.all.shuffle.first(1)
    redirect_to url: category_menu_path(menu.category_id, menu.id)

    # Category.random
  end

  private
  def category_params
    params.require(:category).permit(:name).merge(user_id: current_user.id)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
