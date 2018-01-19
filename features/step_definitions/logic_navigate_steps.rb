# Code below will be evaluated elsewhere by Cucumer
# Given /^I am on the home page/ do
#     visit root_path
# end

When /^I click Logic$/ do
    click_link('logic')
end

Then /^I am on the Logic page$/ do
    puts logic_path
    puts root_path
    expect(page).to have_current_path(logic_path)
end