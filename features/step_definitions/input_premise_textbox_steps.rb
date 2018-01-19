# Given /^I am on the Logic page$/ do
#     visit logic_path
# end

When /^I input text into Premise textbox$/ do |input_term|
    fill_in('input_premise_0', with: 'PvQ->R')
end

Then /^I expect text to be inside Premise textbox$/ do
    expect(page).should have_field('input_premise_0', :with => 'PvQ->R')
end