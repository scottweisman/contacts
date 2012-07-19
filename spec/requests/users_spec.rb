require 'spec_helper'

describe "Users" do
  
  it "allows users to sign up" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Full name', with: 'Scott Weisman'
    fill_in 'group_name', with: 'Weisman Group'
    fill_in 'Email', with: 'scott@example.com'
    fill_in 'Password', with: 'password1'
    click_button 'Sign up'
    page.should have_link('New contact')
  end
  
  it "sets a users group name if blank" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Full name', with: 'Scott Weisman'
    fill_in 'group_name', with: ''
    fill_in 'Email', with: 'scott@example.com'
    fill_in 'Password', with: 'password1'
    click_button 'Sign up'
    page.should have_link('New contact')
    click_link 'Settings'
    page.should have_selector('h4', :text => 'Scott Weisman')
  end
  
end
