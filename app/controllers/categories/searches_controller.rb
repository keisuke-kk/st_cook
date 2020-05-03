class Categories::SearchesController < ApplicationController

  def index
    @categories = Category.search(params[:keyword]).includes(:user).order("created_at DESC").page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json
    end
  end

end

