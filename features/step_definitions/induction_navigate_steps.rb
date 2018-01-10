Given /^I am on the home page/ do
    visit root_path
end

When /^I click induction/ do
    click_link('induction')
end

# Then /^I am on the induction page/ do
#     puts current_url
# end