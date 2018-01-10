# feature/features/LogicPremiseTextBoxInput.feature

Feature: User can input text into Premise text box
  
Scenario: Input text into Premise text box
  Given I am on the Logic page
  When I input text into premise text box
  Then I expect for the text I inputted to appear in text box
  
#   #When I select inputted text in the premise text box
#   #Then I expect the text in the premise text box to be highlighted by the cursor
#   When I delete inputted text in the premise text box
#   Then I expect for the text I deleted to disappear from the corresponding text box