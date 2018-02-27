# features/step_definitions/strong_induction_steps.rb
Given(/^I run my test Code$/) do
  visit ('/induction')
end

Then(/^My code is on Induction page$/) do
  expect(page).to have_content("Basis Step")
end