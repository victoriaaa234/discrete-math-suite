# feature/features/ManualInput.feature
# @wip

Feature: User can utilize all features on Manual Input page
  
Background:
    Given that I am on the Manual Input page
    
Scenario: Solve proof using Modus Ponens with Manual Input
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
    
Scenario: Solve proof using Modus Ponens with Expert Mode
    When I click EXPERT
    And I enter premises for Expert mode
    And I enter a conclusion for Expert mode
    And I enter a proof for Expert mode
    And I click NEXT in the Expert box
    And I check that everything is filled in correctly for Expert mode
    And I click SUBMIT for Expert mode
    Then I see the Success alert for Expert mode
    
Scenario: Solve proof P->Q using Modus Ponens with Latex Mode
    When I click LATEX
    And I enter premises in Latex
    And I enter a conclusion in Latex
    And I enter a proof in Latex
    And I click NEXT in the Latex box
    And I check that everything is filled in correctly for Latex mode
    And I click SUBMIT for Latex mode
    Then I see the Success alert for Latex mode
    
Scenario: Solve proof using Modus Tollens with Manual Input
    When I enter P->Q into Premise 1
    And I enter ~Q into Premise 2
    And I enter ~P into Conclusion
    And I enter P->Q into Step 1
    And I enter A into Step-1 Rules
    And I enter ~Q into Step 2 
    And I enter A into Step-2 Rules
    And I click ADD LINE - MT
    And I enter ~P into Step 3
    And I enter 1,2 into Step-3 Previous Lines
    And I enter Modus Tollens into Step 3 Rules
    And I click SUBMIT - MT
    Then I see the Success alert
  
Scenario: Solve proof using Hypothetical Syllogism with Manual Input
    When I enter P->Q into Premise 1-HS
    And I enter Q->R into Premise 2-HS
    And I enter P->R into Conclusion-HS
    And I enter P->Q into Step 1-HS
    And I enter A into Step 1 Rules-HS
    And I enter Q->R into Step 2-HS
    And I enter A into Step 2 Rules-HS
    And I click ADD LINE - HS
    And I enter P->R into Step 3-HS
    And I enter 1,2 into Step 3 Previous Lines-HS
    And I enter HS into Step 3 Rules
    And I click SUBMIT - HS
    Then I see the Success alert-HS
    
Scenario: Solve proof using Addition with Manual Input
    When I enter P into Premise 1-Addition
    And I enter PvQ into Conclusion-Addition
    And I enter P into Step 1-Addition
    And I enter A into Step 1 Rules-Addition
    And I enter PvQ into Step 2-Addition
    And I enter 1 into Step 2 Previous Lines-Addition
    And I enter Addition into Step 2 Rules
    And I click SUBMIT - Addition
    Then I see the Success alert-Addition
    
Scenario: Solve proof using Simplification with Manual Input
    When I enter P&Q into Premise 1-Simplification
    And I enter Q into Conclusion-Simplification
    And I enter P&Q into Step 1-Simplification
    And I enter A into Step 1 Rules-Simplification
    And I enter Q into Step 2-Simplification
    And I enter 1 into Step 2 Previous Lines-Simplification
    And I enter Simplification into Step 2 Rules
    And I click SUBMIT - Simplification
    Then I see the Success alert-Simplification
    
Scenario: Solve proof using Conjunction with Manual Input
    When I enter P into Premise 1-Conjunction
    And I enter Q into Premise 2-Conjunction
    And I enter P&Q into Conclusion-Conjunction
    And I enter P into Step 1-Conjunction
    And I enter A into Step 1 Rules-Conjunction
    And I enter Q into Step 2-Conjunction
    And I enter A into Step 2 Rules-Conjunction
    And I click ADD LINE - Conjunction
    And I enter P&Q into Step 3-Conjunction
    And I enter 1,2 into Step 3 Previous Lines-Conjunction
    And I enter Conjunction into Step 3 Rules
    And I click SUBMIT - Conjunction
    Then I see the Success alert-Conjunction
    
    
Scenario: Solve proof using Double Negation with Manual Input
    When I enter ~~P into Premise 1-DN
    And I enter P into Conclusion-DN
    And I enter ~~P into Step 1-DN
    And I enter A into Step 1 Rules-DN
    And I enter P into Step 2-DN
    And I enter 1 into Step 2 Previous Lines-DN
    And I enter DN into Step 2 Rules
    And I click SUBMIT - DN
    Then I see the Success alert-DN
    
Scenario: Solve proof using DeMorgans with Manual Input
    When I enter R into Premise one-DM
    And I enter P&Q into Conclusion-DM
    And I enter R into Step one-DM
    And I enter A into Step 1 Rules-DM
    And I enter P&Q into Step 2-DM
    And I enter 1 into Step 2 Previous Lines-DM
    And I enter DM into Step 2 Rules
    And I click SUBMIT - DM
    Then I see the Success alert-DM