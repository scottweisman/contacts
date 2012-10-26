def signin(user)
  visit signin_path
  page.should have_content('Sign in')
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'   
end