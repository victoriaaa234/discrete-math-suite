#Background
Given /^that I am on the Logic Options page$/ do
    visit('/logic_options')
end

#Scenario: Click Practice Problems
When /^I click Practice Problems$/ do
    click_link('practice problems')
end

Then /^I am on the Practice Problems page$/ do
    expect(page).to have_current_path('/logic/problem')
end

#Scenario: Click Manual Input
When /^I click Manual Input$/ do
    click_link('manual input')
end

Then /^I am on the Manual Input page$/ do
    expect(page).to have_current_path('/logic')
end