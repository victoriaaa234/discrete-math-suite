# feature/logic_features/InputProofTextboxInput.feature
Feature: User can input text into Proof textbox
  
Scenario: Input text into Proof textbox
  Given I am on the Logic page
  When I input text into Proof textbox
  Then I expect text to be inside Proof textbox