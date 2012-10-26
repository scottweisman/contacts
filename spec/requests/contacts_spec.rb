require 'spec_helper'

describe "Contacts" do
  
  before :each do
    @user = FactoryGirl.create(:user)
    @group = FactoryGirl.create(:group)
    @user.group = @group
    @user.save
    signin(@user)
  end
  
  describe "contacts/index" do
    it "displays a list of contacts" do
      @contact = FactoryGirl.create(:contact)
      visit contacts_path
      page.should have_content @contact.first_name
      page.should have_content @contact.last_name
    end
    
    it "has a link to create new contact" do
      visit contacts_path
      page.should have_link "New contact"
    end
  end
  
  describe "contacts/new" do
    it "allows users to create a new contact" do
      visit contacts_path
      click_link "New contact"
      page.should have_content "Add contact"
      page.should have_content "First name"
      page.should have_content "Last name"
      page.should have_button "Add contact"
    end
  end
  
end
