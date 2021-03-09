Feature: Umami login

  Scenario: Login with valid credentials
    Given I am on the homepage
    When I click "Log in"
    And I fill in "edit-name" with "admin"
    And I fill in "edit-pass" with "admin"
    And I press "Log in"
    Then I should see "Log out"

  Scenario: Login with invalid credentials
    Given I am on the homepage
    When I click "Log in"
    And I fill in "edit-name" with "adminn"
    And I fill in "edit-pass" with "admin"
    And I press "Log in"
    Then I should see "Unrecognized username or password"

  Scenario: Login with empty username and password
    Given I am on the homepage
    When I click "Log in"
    And I press "Log in"
    Then I should not see "Log out"