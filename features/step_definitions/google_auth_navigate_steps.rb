#Scenario: Sign into profile from home page
When /^I am currently on the home page$/ do
    visit root_path
end

When /^I click Sign in with Google from the home page$/ do
    click_link('sign_in')
end

Then /^I am on the Google Authentication page from the home page$/ do
    expect(page).to have_current_path('/auth/google_oauth2')
end

#Scenario: Sign into profile from logic options page
When /^I am currently on the logic options page$/ do
    visit ('/logic_options')
end

When /^I click Sign in with Google from the logic options page$/ do
    click_link('sign_in')
end

Then /^I am on the Google Authentication page from the logic options page$/ do
    expect(page).to have_current_path('/auth/google_oauth2')
end

#Scenario: Sign into profile from practice problems page
When /^I am currently on the practice problems page$/ do
    visit ('/profile')
end

When /^I click Sign in with Google from the practice problems page$/ do
    click_link('sign_in')
end
Then /^I am on the Google Authentication page from the practice problems page$/ do
    expect(page).to have_current_path('/auth/google_oauth2')
end

#Scenario: Sign into profile from manual input page
When /^I am currently on the manual input page$/ do
    visit ('/logic')
end

When /^I click Sign in with Google from the manual input page$/ do
    click_link('sign_in')
end

Then /^I am on the Google Authentication page from the manual input page$/ do
    expect(page).to have_current_path('/auth/google_oauth2')
end

