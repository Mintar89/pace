require 'spec_helper'

feature 'Sign up' do

  scenario 'signs up the user' do
    visit "/"
    click_link "Sign up"
    fill_in "First name", with: "Jane"
    fill_in "Postcode", with: "SW1"
    fill_in "Date of birth", with: "2021-06-01"
    select('Female', from: 'Gender')
    select('Couch', from: 'Running ability')
    select('Speed', from: 'Fitness Goals')
    fill_in "Email", with: "jdoe@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
