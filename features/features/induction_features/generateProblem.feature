# features/features/generateProblem.feature
Feature: User can generate a problem

@javascript
Scenario:
    Given I am on the Induction page
    When I click on Strong Induction
    Then I am given a new Strong Induction problem