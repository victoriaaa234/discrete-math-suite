# feature/features/passwordReset.feature
@wip
Feature: User can reset password

Scenario:
    Given I am on the account page
    When I click on reset password
    Then I have an link sent to me to reset password