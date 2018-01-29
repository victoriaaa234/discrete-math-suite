# feature/features/ManualInput.feature
# @wip

Feature: User can utilize all features on Manual Input page
  
Background:
    Given that I am on the Manual Input page
    
Scenario: Enter a proof using manual input
    When I enter P into Premise 1
    And I enter P->Q into Premise 2
    And I enter Q into Conclusion
    And I enter P into Step 1
    And I enter A into Step 1 Rules
    And I enter P->Q into Step 2 
    And I enter A into Step 2 Rules
    And I click ADD LINE
    And I enter Q into Step 3
    And I enter 1,2 into Step 3 Previous Lines
    And I enter Modus Ponens into Step 3 Rules
    And I click SUBMIT
    Then I see the Success alert
    
Scenario: Enter a proof using Expert mode
    When I click EXPERT
    And I enter premises for Expert mode
    And I enter a conclusion for Expert mode
    And I enter a proof for Expert mode
    And I click NEXT in the Expert box
    And I check that everything is filled in correctly for Expert mode
    And I click SUBMIT for Expert mode
    Then I see the Success alert for Expert mode
    
# Scenario: Enter a proof using Latex mode
#     When I click LATEX
#     And I enter premises in Latex
#     And I enter a conclusion in Latex
#     And I enter a proof in Latex
#     And I click NEXT in the Latex box
#     And I check that everything is filled in correctly for Latex mode
#     And I click SUBMIT for Latex mode
#     Then I see the Success alert for Latex mode