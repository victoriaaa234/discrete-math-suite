Given /^(?:|I )am on the (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I input "(.+)" into premise_0 text box$/ do |input_term|
    field = find_field("input#premise_0")
end

Then("I expect for the text I inputted to appear in the corresponding text box") do
  expect(field).to have_content(input_term)
end

When("I delete inputted text in the premise text box") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I expect for the text I deleted to disappear from the corresponding text box") do
  pending # Write code here that turns the phrase above into concrete actions
end

