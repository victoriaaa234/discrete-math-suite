# features/step_definitions/strong_induction_steps.rb
Given(/^I am on the Induction page$/) do
  visit ('/induction')
end

When(/^I click on the Strong Induction button$/) do
	find('load-strong').find(:xpath, 'option[1]').select_option

	#select('Strong Induction', :from=>'dropdown-content', visible: false)
 	#find("input.dropdown-button btn", :visible => false).click
	#find("li", text: "Strong Induction").click
end

Then(/^I am given a Strong Induction problem$/) do
  expect(page).to have_content("Use strong induction to prove that any amount of postage that is")
end