Given /^I am on the home page/ do
    visit root_path
end

When /^I click induction/ do
    click_link('induction')
end