#Background
Given /^that I am on the Manual Input page$/ do
    visit('/logic')
end

#Scenario: Enter a proof using manual input
When /^I enter P into Premise 1$/ do
    fill_in('input_premise_1', with: 'P')
    expect(page).to have_field('input_premise_1', with: 'P')
end

And /^I enter P->Q into Premise 2$/ do
    fill_in('input_premise_2', with: 'P->Q')
    expect(page).to have_field('input_premise_2', with: 'P->Q')
end

And /^I enter Q into Conclusion$/ do
    fill_in('input_conclusion_1', with: 'Q')
    expect(page).to have_field('input_conclusion_1', with: 'Q')
end

And /^I enter P into Step 1$/ do
    fill_in('proof_step_input_1', with: 'P')
    expect(page).to have_field('proof_step_input_1', with: 'P')
end

And /^I enter A into Step 1 Rules$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter P->Q into Step 2$/ do
    fill_in('proof_step_input_2', with: 'P->Q')
    expect(page).to have_field('proof_step_input_2', with: 'P->Q')
end

And /^I enter A into Step 2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
end

And /^I click ADD LINE$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#ProofsAddLine', :visible => false).click
    # page.execute_script("addPremiseRow()")
    expect(page).to have_field('proof_step_input_3')
    # puts page.body
end

And /^I enter Q into Step 3$/ do
    fill_in('proof_step_input_3', with: 'Q', disabled: false)
    expect(page).to have_field('proof_step_input_3', with: 'Q')
end

And /^I enter 1,2 into Step 3 Previous Lines$/ do
    fill_in('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
end

And /^I enter Modus Ponens into Step 3 Rules$/ do
    fill_in('proof_rules_input_3', with: 'Modus Ponens')
    expect(page).to have_field('proof_rules_input_3', with: 'Modus Ponens')
end

And /^I click SUBMIT$/ do
    find('#LogicSubmit', :visible => false).click
end

Then /^I see the Success alert$/ do
    page.has_content('Success')
end

#Scenario: Enter a proof using Expert mode
When /^I click EXPERT$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#expertheader', :visible => false).click
    # page.execute_script("#modal1")
    expect(page).to have_field('premise-expert')
    expect(page).to have_field('conclusion-expert')
    expect(page).to have_field('proof-expert')
    # puts page.body
end
When /^I enter premises for Expert mode$/ do
    fill_in('premise-expert', with: 'P, P->Q')
    expect(page).to have_field('premise-expert', with: 'P, P->Q')
end

And /^I enter a conclusion for Expert mode$/ do
    fill_in('conclusion-expert', with: 'Q')
    expect(page).to have_field('conclusion-expert', with: 'Q')
end

And /^I enter a proof for Expert mode$/ do
    fill_in('proof-expert', with: 'P  A "\n" P->Q  A "\n" Q 1,2 Modus Ponens')
    expect(page).to have_field('proof-expert', with: 'P  A "\n" P->Q  A "\n" Q 1,2 Modus Ponens')
end

And /^I click NEXT in the Expert box$/ do
    #The label for the next button should be changed in order to 
    #avoid ambiguity between Expert and Latex mode
    click_on('Next')
end

And /^I check that everything is filled in correctly for Expert mode$/ do
    expect(page).to have_field('input_premise_1', with: 'P')
    expect(page).to have_field('input_premise_2', with: 'P->Q')
    expect(page).to have_field('input_conclusion_1', with: 'Q')
    expect(page).to have_field('proof_step_input_1', with: 'P')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_step_input_2', with: 'P->Q')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_step_input_3', with: 'Q')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_rules_input_3', with: 'Modus Ponens')
end

And /^I click SUBMIT for Expert mode$/ do
    find('#LogicSubmit', :visible => false).click
end

Then /^I see the Success alert for Expert mode$/ do
    page.has_content('Success')
end

#Scenario: Enter a proof using Latex mode
#I need to figure out how Latex works to actually write the test for it
When /^I click LATEX$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#expertheader', :visible => false).click
    # page.execute_script("#modal2")
    expect(page).to have_field('premise-expert')
    expect(page).to have_field('conclusion-expert')
    expect(page).to have_field('proof-expert')
    # puts page.body
end
When /^I enter premises in Latex$/ do
    fill_in('premise-expert', with: '\P,P->Q ')
    expect(page).to have_field('premise-expert', with: 'P, P->Q')
end

And /^I enter a conclusion in Latex$/ do
    fill_in('conclusion-expert', with: '\Q,')
    expect(page).to have_field('conclusion-expert', with: 'Q')
end

And /^I enter a proof in Latex$/ do
    fill_in('proof-expert', with: 'P  A "\n" P->Q  A "\n" Q 1,2 Modus Ponens')
    expect(page).to have_field('proof-expert', with: 'P  A "\n" P->Q  A "\n" Q 1,2 Modus Ponens')
end

And /^I click NEXT in the Latex box$/ do
    #The label for the next button should be changed in order to 
    #avoid ambiguity between Expert and Latex mode
    click_on('Next')
end

And /^I check that everything is filled in correctly for Latex mode$/ do
    expect(page).to have_field('input_premise_1', with: 'P')
    expect(page).to have_field('input_premise_2', with: 'P->Q')
    expect(page).to have_field('input_conclusion_1', with: 'Q')
    expect(page).to have_field('proof_step_input_1', with: 'P')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_step_input_2', with: 'P->Q')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_step_input_3', with: 'Q')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_rules_input_3', with: 'Modus Ponens')
end

And /^I click SUBMIT for Latex mode$/ do
    find('#LogicSubmit', :visible => false).click
end

Then /^I see the Success alert for Latex mode$/ do
    page.has_content('Success')
end