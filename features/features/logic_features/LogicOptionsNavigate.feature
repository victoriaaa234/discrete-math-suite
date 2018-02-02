# feature/features/LogicOptionsNavigation.feature
# @wip

Feature: User can click Practice Problems or Manual Input and go to correct page
  
Background:
    Given that I am on the Logic Options page

Scenario: Click Practice Problems
    When I click Practice Problems
    Then I am on the Practice Problems page
    
Scenario: Click Manual Input
    When I click Manual Input
    Then I am on the Manual Input page
    