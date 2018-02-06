# feature/features/GoogleAuthNavigate.feature
# @wip

Feature: User can sign into profile using Google Authentication

Scenario: Sign into profile from home page
    When I am currently on the home page
    When I click Sign in with Google from the home page
    Then I am on the Google Authentication page from the home page
    
Scenario: Sign into profile from logic options page
    When I am currently on the logic options page
    When I click Sign in with Google from the logic options page
    Then I am on the Google Authentication page from the logic options page
    
Scenario: Sign into profile from practice problems page
    When I am currently on the practice problems page
    When I click Sign in with Google from the practice problems page
    Then I am on the Google Authentication page from the practice problems page
    
Scenario: Sign into profile from manual input page
    When I am currently on the manual input page
    When I click Sign in with Google from the manual input page
    Then I am on the Google Authentication page from the manual input page