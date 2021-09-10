require 'rails_helper'

RSpec.describe "Jokes", type: :system do
  describe 'ログイン前' do
    let(:user) { create(:user) }

    describe '一覧ページ' do
      it 'あるあるネタ一覧が表示されている' do
        joke_list = create_list(:joke, 3, user: user)
        visit root_path
        expect(page).to have_content joke_list[0].sentence
        expect(page).to have_content joke_list[1].sentence
        expect(page).to have_content joke_list[2].sentence
        expect(current_path).to eq '/'
      end
    end

    describe '投稿ページ' do
      it 'ログインページにリダイレクトされる' do
        visit root_path
        click_on '投稿'
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq '/login'
      end
    end
  end

  describe 'ログイン後' do
    let(:user) { create(:user) }

    before do
      login user
    end

    describe '投稿ページ' do
      it 'あるあるネタの投稿に成功する' do
        visit root_path
        click_link '投稿'
        fill_in 'sentence', with: 'あるあるネタ投稿します'
        click_button '投稿'
        expect(page).to have_content 'あるあるネタを投稿しました'
        expect(page).to have_content 'あるあるネタ投稿します'
        expect(page).to have_content user.name
        expect(current_path).to eq '/'
      end
    end

    describe '投稿の削除' do
      context '自分の投稿' do
        let!(:joke) { create(:joke, user: user) }
        it '投稿の削除に成功する' do
          visit root_path
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content 'あるあるネタを削除しました'
          expect(page).not_to have_content joke.sentence
          expect(current_path).to eq '/'
        end
      end

      context '他人の投稿' do
        let!(:joke) { create(:joke) }
        it '削除ボタンが表示されない' do
          visit root_path
          expect(page).not_to have_content '削除'
        end
      end
    end
  end

  describe 'ソート機能' do
    let!(:joke_with_3vote) { create(:joke) }
    let!(:joke_with_2vote) { create(:joke) }
    let!(:joke_with_1vote) { create(:joke) }

    before do
      create_list(:vote, 3, joke: joke_with_3vote)
      create_list(:vote, 2, joke: joke_with_2vote)
      create_list(:vote, 1, joke: joke_with_1vote)
    end

    context '投票順ボタンを押す' do
      it '投稿が投票の多い順にソートされること' do
        visit root_path
        click_on '投票数順'
        sleep 1
        joke_sentences = page.all('.joke_sentence')
        expect(joke_sentences[0].text).to eq  joke_with_3vote.sentence
        expect(joke_sentences[1].text).to eq  joke_with_2vote.sentence
        expect(joke_sentences[2].text).to eq  joke_with_1vote.sentence
      end
    end

    context '新しい順ボタンを押す' do
      it '投稿日時が新しい順にソートされること' do
        visit root_path
        click_on '新しい順'
        sleep 1
        joke_sentences = page.all('.joke_sentence')
        expect(joke_sentences[0].text).to eq  joke_with_1vote.sentence
        expect(joke_sentences[1].text).to eq  joke_with_2vote.sentence
        expect(joke_sentences[2].text).to eq  joke_with_3vote.sentence
      end
    end

    context '古い順ボタンを押す' do
      it '投稿日時が古い順にソートされること' do
        visit root_path
        click_on '古い順'
        sleep 1
        joke_sentences = page.all('.joke_sentence')
        expect(joke_sentences[0].text).to eq  joke_with_3vote.sentence
        expect(joke_sentences[1].text).to eq  joke_with_2vote.sentence
        expect(joke_sentences[2].text).to eq  joke_with_1vote.sentence
      end
    end
  end
end
