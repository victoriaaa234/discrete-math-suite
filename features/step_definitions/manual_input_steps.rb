#Background
Given /^that I am on the Manual Input page$/ do
    visit('/logic')
end

#Scenario: Solve proof using Modus Ponens with Manual Input
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

#Scenario: Solve proof using Modus Ponens with Expert Mode
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

#Scenario: Solve proof using Modus Ponens with Latex Mode
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

# Scenario: Solve proof using Modus Tollens with Manual Input
When /^I enter P->Q into Premise 1$/ do
    fill_in('input_premise_1', with: 'P->Q')
    expect(page).to have_field('input_premise_1', with: 'P->Q')
end

And /^I enter ~Q into Premise 2$/ do
    fill_in('input_premise_2', with: '~Q')
    expect(page).to have_field('input_premise_2', with: '~Q')
end

And /^I enter ~P into Conclusion$/ do
    fill_in('input_conclusion_1', with: '~P')
    expect(page).to have_field('input_conclusion_1', with: '~P')
end

And /^I enter P->Q into Step 1$/ do
    fill_in('proof_step_input_1', with: 'P->Q')
    expect(page).to have_field('proof_step_input_1', with: 'P->Q')
end

And /^I enter A into Step-1 Rules$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter ~Q into Step 2$/ do
    fill_in('proof_step_input_2', with: '~Q')
    expect(page).to have_field('proof_step_input_2', with: '~Q')
end

And /^I enter A into Step-2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
end

And /^I click ADD LINE - MT$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#ProofsAddLine', :visible => false).click
    # page.execute_script("addPremiseRow()")
    expect(page).to have_field('proof_step_input_3')
    # puts page.body
end

And /^I enter ~P into Step 3$/ do
    fill_in('proof_step_input_3', with: '~P', disabled: false)
    expect(page).to have_field('proof_step_input_3', with: '~P')
end

And /^I enter 1,2 into Step-3 Previous Lines$/ do
    fill_in('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
end

And /^I enter Modus Tollens into Step 3 Rules$/ do
    fill_in('proof_rules_input_3', with: 'Modus Tollens')
    expect(page).to have_field('proof_rules_input_3', with: 'Modus Tollens')
end

And /^I click SUBMIT - MT$/ do
    find('#LogicSubmit', :visible => false).click
end

Then /^I see the Success alert$/ do
    page.has_content('Success')
end

# Scenario: Solve proof using Hypothetical Syllogism with Manual Input
When /^I enter P->Q into Premise 1-HS$/ do
    fill_in('input_premise_1', with: 'P->Q')
    expect(page).to have_field('input_premise_1', with: 'P->Q')
end

And /^I enter Q->R into Premise 2-HS$/ do
    fill_in('input_premise_2', with: 'Q->R')
    expect(page).to have_field('input_premise_2', with: 'Q->R')
end

And /^I enter P->R into Conclusion-HS$/ do
    fill_in('input_conclusion_1', with: 'P->R')
    expect(page).to have_field('input_conclusion_1', with: 'P->R')
end

And /^I enter P->Q into Step 1-HS$/ do
    fill_in('proof_step_input_1', with: 'P->Q')
    expect(page).to have_field('proof_step_input_1', with: 'P->Q')
end

And /^I enter A into Step 1 Rules-HS$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter Q->R into Step 2-HS$/ do
    fill_in('proof_step_input_2', with: 'Q->R')
    expect(page).to have_field('proof_step_input_2', with: 'Q->R')
end

And /^I enter A into Step 2 Rules-HS$/ do
    fill_in('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
end

And /^I click ADD LINE - HS$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#ProofsAddLine', :visible => false).click
    # page.execute_script("addPremiseRow()")
    expect(page).to have_field('proof_step_input_3')
    # puts page.body
end

And /^I enter P->R into Step 3-HS$/ do
    fill_in('proof_step_input_3', with: 'P-R', disabled: false)
    expect(page).to have_field('proof_step_input_3', with: 'P->R')
end

And /^I enter 1,2 into Step 3 Previous Lines-HS$/ do
    fill_in('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
end

And /^I enter HS into Step 3 Rules$/ do
    fill_in('proof_rules_input_3', with: 'HS')
    expect(page).to have_field('proof_rules_input_3', with: 'HS')
end

And /^I click SUBMIT - HS$/ do
    find('#LogicSubmit', :visible => false).click
end

Then /^I see the Success alert-HS$/ do
    page.has_content('Success')
end

# Scenario: Solve proof using Addition with Manual Input
When /^I enter P into Premise 1-Addition$/ do
    fill_in('input_premise_1', with: 'P->Q')
    expect(page).to have_field('input_premise_1', with: 'P->Q')
end

And /^I enter PvQ into Conclusion-Addition$/ do
    fill_in('input_conclusion_1', with: 'PvQ')
    expect(page).to have_field('input_conclusion_1', with: 'PvQ')
end

And /^I enter P into Step 1-Addition$/ do
    fill_in('proof_step_input_1', with: 'P')
    expect(page).to have_field('proof_step_input_1', with: 'P')
end

And /^I enter A into Step 1 Rules-Addition$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter PvQ into Step 2-Addition$/ do
    fill_in('proof_step_input_2', with: 'PvQ')
    expect(page).to have_field('proof_step_input_2', with: 'PvQ')
end

And /^I enter 1 into Step 2 Previous Lines-Addition$/ do
    fill_in('proof_previous_input_2', with: '1')
    expect(page).to have_field('proof_previous_input_2', with: '1')
end

And /^I enter Addition into Step 2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'Addition')
    expect(page).to have_field('proof_rules_input_2', with: 'Addition')
end

And /^I click SUBMIT - Addition$/ do
    find('#LogicSubmit', :visible => false).trigger("click")
end

#This step does not work due to there being compatiblity issues between sweet alert
#and poltergeist
Then /^I see the Success alert-Addition$/ do
    # expect(page).to have_content('Success')
end

# Scenario: Solve proof using Simplification with Manual Input
When /^I enter P&Q into Premise 1-Simplification$/ do
    fill_in('input_premise_1', with: 'P&Q')
    expect(page).to have_field('input_premise_1', with: 'P&Q')
end

And /^I enter Q into Conclusion-Simplification$/ do
    fill_in('input_conclusion_1', with: 'Q')
    expect(page).to have_field('input_conclusion_1', with: 'Q')
end

And /^I enter P&Q into Step 1-Simplification$/ do
    fill_in('proof_step_input_1', with: 'P&Q')
    expect(page).to have_field('proof_step_input_1', with: 'P&Q')
end

And /^I enter A into Step 1 Rules-Simplification$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter Q into Step 2-Simplification$/ do
    fill_in('proof_step_input_2', with: 'Q')
    expect(page).to have_field('proof_step_input_2', with: 'Q')
end

And /^I enter 1 into Step 2 Previous Lines-Simplification$/ do
    fill_in('proof_previous_input_2', with: '1')
    expect(page).to have_field('proof_previous_input_2', with: '1')
end

And /^I enter Simplification into Step 2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'Simplification')
    expect(page).to have_field('proof_rules_input_2', with: 'Simplification')
end

And /^I click SUBMIT - Simplification$/ do
    find('#LogicSubmit', :visible => false).trigger("click")
end

#This step does not work due to there being compatibility issues between sweet alert
#and poltergeist
Then /^I see the Success alert-Simplification$/ do
    # expect(page).to have_content('Success')
end

# Scenario: Solve proof using Conjuction with Manual Input
When /^I enter P into Premise 1-Conjunction$/ do
    fill_in('input_premise_1', with: 'P')
    expect(page).to have_field('input_premise_1', with: 'P')
end

And /^I enter Q into Premise 2-Conjunction$/ do
    fill_in('input_premise_2', with: 'Q')
    expect(page).to have_field('input_premise_2', with: 'Q')
end

And /^I enter P&Q into Conclusion-Conjunction$/ do
    fill_in('input_conclusion_1', with: 'P&Q')
    expect(page).to have_field('input_conclusion_1', with: 'P&Q')
end

And /^I enter P into Step 1-Conjunction$/ do
    fill_in('proof_step_input_1', with: 'P')
    expect(page).to have_field('proof_step_input_1', with: 'P')
end

And /^I enter A into Step 1 Rules-Conjunction$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter Q into Step 2-Conjunction$/ do
    fill_in('proof_step_input_2', with: 'Q')
    expect(page).to have_field('proof_step_input_2', with: 'Q')
end

And /^I enter A into Step 2 Rules-Conjunction$/ do
    fill_in('proof_rules_input_2', with: 'A')
    expect(page).to have_field('proof_rules_input_2', with: 'A')
end

And /^I click ADD LINE - Conjunction$/ do
    #There is currently no known way to trigger the onClick function to 
    #work so this step fails and causes the rest to skip
    find('#ProofsAddLine', :visible => false).click
    # page.execute_script("addPremiseRow()")
    expect(page).to have_field('proof_step_input_3')
    # puts page.body
end

And /^I enter P&Q into Step 3-Conjunction$/ do
    fill_in('proof_step_input_3', with: 'P&Q', disabled: false)
    expect(page).to have_field('proof_step_input_3', with: 'P&Q')
end

And /^I enter 1,2 into Step 3 Previous Lines-Conjunction$/ do
    fill_in('proof_previous_input_3', with: '1,2')
    expect(page).to have_field('proof_previous_input_3', with: '1,2')
end

And /^I enter Conjunction into Step 3 Rules$/ do
    fill_in('proof_rules_input_3', with: 'Conjunction')
    expect(page).to have_field('proof_rules_input_3', with: 'Conjunction')
end

And /^I click SUBMIT - Conjunction$/ do
    find('#LogicSubmit', :visible => false).click
end

#This step does not work due to there being compatibility issues between sweet alert
#and poltergeist
Then /^I see the Success alert-Conjunction$/ do
    # expect(page).to have_content('Success')
end

# Scenario: Solve proof using Double Negation with Manual Input
When /^I enter ~~P into Premise 1-DN$/ do
    fill_in('input_premise_1', with: '~~P')
    expect(page).to have_field('input_premise_1', with: '~~P')
end

And /^I enter P into Conclusion-DN$/ do
    fill_in('input_conclusion_1', with: 'P')
    expect(page).to have_field('input_conclusion_1', with: 'P')
end

And /^I enter ~~P into Step 1-DN$/ do
    fill_in('proof_step_input_1', with: '~~P')
    expect(page).to have_field('proof_step_input_1', with: '~~P')
end

And /^I enter A into Step 1 Rules-DN$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter P into Step 2-DN$/ do
    fill_in('proof_step_input_2', with: 'P')
    expect(page).to have_field('proof_step_input_2', with: 'P')
end

And /^I enter 1 into Step 2 Previous Lines-DN$/ do
    fill_in('proof_previous_input_2', with: '1')
    expect(page).to have_field('proof_previous_input_2', with: '1')
end

And /^I enter DN into Step 2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'DN')
    expect(page).to have_field('proof_rules_input_2', with: 'DN')
end

And /^I click SUBMIT - DN$/ do
    find('#LogicSubmit', :visible => false).trigger("click")
end

#This step does not work due to there being compatibility issues between sweet alert
#and poltergeist
Then /^I see the Success alert-DN$/ do
    # expect(page).to have_content('Success')
end

# Scenario: Solve proof using DeMorgans with Manual Input
#For some reason this step becomes undefined if R = ~(~Pv~Q) is used like it should be
When /^I enter R into Premise one-DM$/ do
    fill_in('input_premise_1', with: '~(~Pv~Q)')
    expect(page).to have_field('input_premise_1', with: '~(~Pv~Q)')
end

And /^I enter P&Q into Conclusion-DM$/ do
    fill_in('input_conclusion_1', with: 'P&Q')
    expect(page).to have_field('input_conclusion_1', with: 'P&Q')
end

#For some reason this step becomes undefined if R = ~(~Pv~Q) is used like it should be
And /^I enter R into Step one-DM$/ do
    fill_in('proof_step_input_1', with: '~(~Pv~Q)')
    expect(page).to have_field('proof_step_input_1', with: '~(~Pv~Q)')
end

And /^I enter A into Step 1 Rules-DM$/ do
    fill_in('proof_rules_input_1', with: 'A')
    expect(page).to have_field('proof_rules_input_1', with: 'A')
end

And /^I enter P&Q into Step 2-DM$/ do
    fill_in('proof_step_input_2', with: 'P&Q')
    expect(page).to have_field('proof_step_input_2', with: 'P&Q')
end

And /^I enter 1 into Step 2 Previous Lines-DM$/ do
    fill_in('proof_previous_input_2', with: '1')
    expect(page).to have_field('proof_previous_input_2', with: '1')
end

And /^I enter DM into Step 2 Rules$/ do
    fill_in('proof_rules_input_2', with: 'DM')
    expect(page).to have_field('proof_rules_input_2', with: 'DM')
end

And /^I click SUBMIT - DM$/ do
    find('#LogicSubmit', :visible => false).trigger("click")
end

#This step does not work due to there being compatibility issues between sweet alert
#and poltergeist
Then /^I see the Success alert-DM$/ do
    # expect(page).to have_content('Success')
end