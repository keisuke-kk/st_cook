require 'rails_helper'

feature 'cateory', type: :feature do
  let(:user) { create(:user) }

  scenario 'ユーザー情報が更新されていること' do
    # ログイン前には新規カテゴリーボタンがない
    visit root_path
    expect(page).to have_no_content('新規カテゴリー')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('新規カテゴリー')

    # 新規カテゴリーの作成
    expect {
      click_link('新規カテゴリー')
      expect(current_path).to eq new_category_path
      fill_in 'name', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Category, :count).by(1)
  end
end