require 'spec_helper'

feature 'User endorsements' do
  scenario 'a user shows when they do not have endorsements' do
    sign_up_jane

    click_link "View profile"

    expect(page).to have_content "Jane"
    expect(page).not_to have_content "👍 0"
  end

  scenario 'a user can endorse another user' do
    sign_up_jane
    click_link "Logout"
    sign_up_mark

    click_button "View Jane's Profile"

    fill_in "endorsement[body]", with: "I loved running with Jane"
    click_button "👍"

    expect(page).to have_content "Jane"
    expect(page).to have_content "Message this user"
    expect(page).to have_content "👍 Mark - I loved running with Jane"
  end
end