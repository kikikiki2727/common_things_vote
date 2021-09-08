require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe 'ログイン' do
    let!(:user) { create(:user) }

    before do
      visit root_path
      click_link 'ログイン'
    end

    describe '成功系' do
      context '有効な値を入れる' do
        it 'ログインに成功する' do
          fill_in 'email', with: user.email
          fill_in 'password', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました'
          expect(current_path).to eq '/'
        end
      end
    end

    describe '失敗系' do
      context 'メールアドレスを空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'email', with: ''
          fill_in 'password', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content 'メールアドレスは必須項目です'
          expect(page).to have_content 'ログインできませんでした'
          expect(current_path).to eq '/login'
        end
      end

      context 'パスワードを空欄にする' do
        it '必須項目のメッセージが表示される' do
          fill_in 'email', with: user.email
          fill_in 'password', with: ''
          click_button 'ログイン'
          expect(page).to have_content 'パスワードは必須項目です'
          expect(page).to have_content 'ログインできませんでした'
          expect(current_path).to eq '/login'
        end
      end
    end
  end

  describe 'ログアウト' do
    let(:user) { create(:user) }

    before do
      login user
    end

    it 'ログアウトに成功する' do
      visit root_path
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました'
      expect(current_path).to eq '/'
    end
  end
end
