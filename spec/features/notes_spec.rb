require 'spec_helper'

describe "Notes" do
  
  describe "contacts#index" do
    it "allows users to add a note from contacts#index" do
      @contact = FactoryGirl.create(:contact)
      visit contacts_path
      click_link "#{@contact.first_name} #{@contact.last_name}"
      click_link "Add note"
      fill_in "note_content", :with => 'important note'
      click_button "Add note"
      click_link "#{@contact.first_name @contacact.last_name}"
      click_link "View contact"
      page.should have_content "important note"
    end
  end
    
  describe "contacts#show" do
    it "allows users to add a note from contacts#show" do
      @contact = FactoryGirl.create(:contact)
      visit contacts_path
      click_link "#{@contact.first_name} #{@contact.last_name}"
      click_link "View contact"
      click_link "Add note"
      fill_in "note_content", :with => 'important note'
      click_button "Add note"
      page.should have_content "important note"
    end
  end
  
end
