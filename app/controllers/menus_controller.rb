class MenusController < ApplicationController

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

  private
  def menu_params
    params.require(:menu).permit(:title, :detail, :image).merge(user_id: current_user.id, category_id: params[:category_id])
  end

end
