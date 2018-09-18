require 'spec_helper'

describe "GET '/' - Greeting Form" do
  # Code from previous example
  it 'welcomes the user' do
    visit '/' #visit is Capybara method; navigates test's browser to specific URL ; 
              #accepts string argument
    expect(page.body).to include("Welcome!") #page is Capybara method; exposes session/browser being used; 
                                             #responds to click_link, fill_in, and body
                                             #page.body gets all HTML in a string format
  end

  # New test
  it 'has a greeting form with a user_name field' do
    visit '/'

    expect(page).to have_selector("form")
    expect(page).to have_field(:user_name)
  end
end

describe "POST '/greet' - User Greeting" do
  it 'greets the user personally based on their user_name in the form' do
    visit '/'

    fill_in(:user_name, :with => "Avi")
    click_button "Submit"

    expect(page).to have_text("Hi Avi, nice to meet you!")
  end
end