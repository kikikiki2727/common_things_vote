require 'rails_helper'

RSpec.describe "Votes", type: :system do
  describe '投票する' do
    let!(:joke) { create(:joke) }

    it '投票数が反映されること' do
      visit root_path
      5.times do
        click_on '投票'
      end
      expect(page).to have_content '5票'
    end
  end
end
