Given /^I am on the home page$/ do
    visit root_path
end

When /^I click Logic$/ do
    click_link('logic')
end

Then /^I am on the Logic Options page$/ do
    expect(page).to have_current_path('/logic_options')
end