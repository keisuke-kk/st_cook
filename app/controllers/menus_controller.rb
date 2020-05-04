class MenusController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def new
    @menu = Menu.new
  end

  def create
    menu = Menu.create(menu_params)
    redirect_to category_path(params[:category_id]) 
  end

  def show
    @category = Category.find(params[:category_id])
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to category_menu_path(menu.category_id, menu.id)
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to root_path
  end

  # def random
  #   # Menu.random
  #   # menu = Menu.offset( rand(Menu.count) ).first.take(1)

  #   menu = Menu.all.shuffle.first(1)
  #   redirect_to url: category_menu_path(menu.id)
  # end

  private
  def menu_params
    params.require(:menu).permit(:title, :detail, :image).merge(user_id: current_user.id, category_id: params[:category_id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
