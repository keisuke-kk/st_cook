require 'rails_helper'

describe CategoriesController, type: :controller do

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@categoryに正しい値が入っていること" do
      category = create(:category)
      get :edit, params: { id: category }
      expect(assigns(:category)).to eq category
    end

    it "edit.html.hamlに遷移すること" do
      category = create(:category)
      get :edit, params: { id: category }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@categoryに正しい値が入っていること" do
      categories = create_list(:category, 3)
      get :index 
      expect(assigns(:category)).to match(categories.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end