Given /^I am on the logic page/ do
    puts visit logic_path
end

When /^I input text into premise textbox$/ do |input_term|
    fill_in('input_premise_0', with: 'PvQ->R')
end

Then /^I expect text to be inside textbox$/ do
    expect(page).to have_field('input_premise_0', with: 'PvQ->R')
end