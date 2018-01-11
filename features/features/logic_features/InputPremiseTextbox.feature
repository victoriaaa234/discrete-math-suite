# feature/features/InputPremiseTextBoxInput.feature
Feature: User can input text into Premise textbox
  
Scenario: Input text into Premise textbox
  Given I am on the Logic page
  When I input text into Premise textbox
  Then I expect text to be inside Premise textbox
  
#   #When I select inputted text in the premise text box
#   #Then I expect the text in the premise text box to be highlighted by the cursor
#   When I delete inputted text in the premise text box
#   Then I expect for the text I deleted to disappear from the corresponding text box