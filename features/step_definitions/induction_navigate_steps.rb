# Code below will be evaluated elsewhere by Cucumer
# Given /^I am on the home page$/ do
#     visit root_path
# end

When /^I click Induction$/ do
    click_link('induction')
end

Then /^I am on the Induction page$/ do
    puts induction_path
    expect(page).to have_current_path(induction_path)
end
