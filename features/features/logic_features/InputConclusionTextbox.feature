# feature/logic_features/InputConclusionTextboxInput.feature
@wip
Feature: User can input text into Conclusion textbox
  
Scenario: Input text into Conclusion textbox
  Given I am on the Logic page
  When I input text into Conclusion textbox
  Then I expect text to be inside Conclusion textbox