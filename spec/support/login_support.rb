module LoginSupport
  def login(user)
    visit root_path
    click_link 'ログイン'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end

  def logout
    find('.navbar-toggler').click
    click_on 'ログアウト'
  end
end
