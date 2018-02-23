# features/step_definitions/click_induction_steps.rb
Given(/^I am on the Home page$/) do
  visit root_path
end

When(/^I click on the Induction button$/) do
  click_on "induction"
end

Then(/^I am sent to the Induction page$/) do
  expect(page).to have_content("Use mathematical induction to prove that")
end