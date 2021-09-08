require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー登録' do
    before do
      visit root_path
      click_on 'ユーザー登録'
    end

    describe '成功系' do
      context '有効な値を入れる' do
        it 'ユーザー登録に成功する' do
          fill_in 'name', with: '名前'
          fill_in 'email', with: 'email@example.com'
          fill_in 'password', with: 'password'
          fill_in 'password_confirmation', with: 'password'
          click_on '登録'
          expect(page).to have_content 'ユーザー登録しました'
          expect(current_path).to eq '/login'
        end
      end
    end

    describe '失敗系' do
      context '名前を空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'name', with: ''
          fill_in 'email', with: 'email@example.com'
          fill_in 'password', with: 'password'
          fill_in 'password_confirmation', with: 'password'
          click_on '登録'
          expect(page).to have_content '名前は必須項目です'
          expect(current_path).to eq '/register'
        end
      end

      context 'メールアドレスを空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'name', with: '名前'
          fill_in 'email', with: ''
          fill_in 'password', with: 'password'
          fill_in 'password_confirmation', with: 'password'
          click_on '登録'
          expect(page).to have_content 'メールアドレスは必須項目です'
          expect(current_path).to eq '/register'
        end
      end

      context 'すでに登録されているメールアドレスで登録する' do
        let!(:user) { create(:user) }
        
        it '一意のエラーメッセージが表示される' do
          fill_in 'name', with: '名前'
          fill_in 'email', with: user.email
          fill_in 'password', with: 'password'
          fill_in 'password_confirmation', with: 'password'
          click_on '登録'
          expect(page).to have_content 'そのメールアドレスはすでに登録されています'
          expect(current_path).to eq '/register'
        end
      end

      context 'パスワードを空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'name', with: '名前'
          fill_in 'email', with: 'email@example.com'
          fill_in 'password', with: ''
          fill_in 'password_confirmation', with: 'password'
          click_on '登録'
          expect(page).to have_content 'パスワードは必須項目です'
          expect(page).to have_content 'パスワードと一致しません'
          expect(current_path).to eq '/register'
        end
      end

      context 'パスワード（確認）を空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'name', with: '名前'
          fill_in 'email', with: 'email@example.com'
          fill_in 'password', with: 'password'
          fill_in 'password_confirmation', with: ''
          click_on '登録'
          expect(page).to have_content 'パスワード（確認）は必須項目です'
          expect(current_path).to eq '/register'
        end
      end
    end
  end
end
