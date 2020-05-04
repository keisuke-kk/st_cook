class Menus::SearchesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @menus = Menu.search(params[:keyword]).includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
end
