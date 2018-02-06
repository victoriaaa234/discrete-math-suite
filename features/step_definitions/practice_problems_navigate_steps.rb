#Background
Given /^that I am on the Practice Problems page$/ do
    visit('/profile')
end

#Scenario: Click Existential Instantiation Problem 18
When /^I click Problem 18$/ do
    click_link('Problem 18:')
end

Then /^I see the correct practice problem 18$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2018')
end

#Scenario: Click Hypothetical Syllogism Problem 4
When /^I click Problem 4$/ do
    click_link('Problem 4:')
end

Then /^I see the correct practice problem 4$/ do
    expect(page).to have_current_path('/logic?problem_uid=%204')
end

#Scenario: Click Modus Tollens Problem 3
When /^I click Problem 3$/ do
    click_link('Problem 3:')
end

Then /^I see the correct practice problem 3$/ do
    expect(page).to have_current_path('/logic?problem_uid=%203')
end

#Scenario: Click Logical Equivalence Conditional Problem 14
When /^I click Problem 14$/ do
    click_link('Problem 14:')
end

Then /^I see the correct practice problem 14$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2014')
end

#Scenario: Click Simplification Problem 7
When /^I click Problem 7$/ do
    click_link('Problem 7:')
end

Then /^I see the correct practice problem 7$/ do
    expect(page).to have_current_path('/logic?problem_uid=%207')
end


#Scenario: Click Universal Generalization Problem 17
When /^I click Problem 17$/ do
    click_link('Problem 17:')
end

Then /^I see the correct practice problem 17$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2017')
end

#Scenario: Click Commutative Laws Problem 10
When /^I click Problem 10$/ do
    click_link('Problem 10:')
end

Then /^I see the correct practice problem 10$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2010')
end

#Scenario: Click Universal Instantiation Problem 16
When /^I click Problem 16$/ do
    click_link('Problem 16:')
end

Then /^I see the correct practice problem 16$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2016')
end

#Scenario: Click Resolution Problem 9
When /^I click Resolution Problem 9$/ do
    click_link('Problem 9:')
end

Then /^I see the correct Resolution practice problem 9$/ do
    expect(page).to have_current_path('/logic?problem_uid=%209')
end

#Scenario: Click Double Negation Laws Problem 9
When /^I click Double Negation Laws Problem 9$/ do
    click_link('Problem 9:')
end

Then /^I see the correct Double Negation Laws practice problem 9$/ do
    expect(page).to have_current_path('/logic?problem_uid=%209')
end

#Scenario: Click Conjunction Problem 8
When /^I click Problem 8$/ do
    click_link('Problem 8:')
end

Then /^I see the correct practice problem 8$/ do
    expect(page).to have_current_path('/logic?problem_uid=%208')
end

#Scenario: Click DeMorgans Laws Problem 13
When /^I click Problem 13$/ do
    click_link('Problem 13:')
end

Then /^I see the correct practice problem 13$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2013')
end

#Scenario: Click Addition Problem 6
When /^I click Problem 6$/ do
    click_link('Problem 6:')
end

Then /^I see the correct practice problem 6$/ do
    expect(page).to have_current_path('/logic?problem_uid=%206')
end

#Scenario: Click Modus Ponens Problem 1
When /^I click Problem 1$/ do
    click_link('Problem 1:')
end

Then /^I see the correct practice problem 1$/ do
    expect(page).to have_current_path('/logic?problem_uid=%201')
end

#Scenario: Click Modus Ponens Problem 2
When /^I click Problem 2$/ do
    click_link('Problem 2:')
end

Then /^I see the correct practice problem 2$/ do
    expect(page).to have_current_path('/logic?problem_uid=%202')
end

#Scenario: Click Associative Laws Problem 11
When /^I click Problem 11$/ do
    click_link('Problem 11:')
end

Then /^I see the correct practice problem 11$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2011')
end

#Scenario: Click Distributive Laws Problem 12
When /^I click Problem 12$/ do
    click_link('Problem 12:')
end

Then /^I see the correct practice problem 12$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2012')
end

#Scenario: Click Disjunctive Syllogism Problem 5
When /^I click Problem 5$/ do
    click_link('Problem 5:')
end

Then /^I see the correct practice problem 5$/ do
    expect(page).to have_current_path('/logic?problem_uid=%205')
end

#Scenario: Click Logical Equivalence Biconditional Problem 15
When /^I click Problem 15$/ do
    click_link('Problem 15:')
end

Then /^I see the correct practice problem 15$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2015')
end

#Scenario: Click Existential Generalization Problem 19
When /^I click Problem 19$/ do
    click_link('Problem 19:')
end

Then /^I see the correct practice problem 19$/ do
    expect(page).to have_current_path('/logic?problem_uid=%2019')
end