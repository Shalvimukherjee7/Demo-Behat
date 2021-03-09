@javascript
Feature: Login functionality

  Scenario: Verify Login with valid credentials
    Given I am on the homepage
    When I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    Then I should see "Logout"

  Scenario: Verify Login with invalid password
    Given I am on the homepage
    When I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "adminn"
    And I press "Login"
    Then I should see " Warning: No match for E-Mail Address and/or Password."

  Scenario: Verify Login with invalid email
    Given I am on the homepage
    When I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherji@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    Then I should see " Warning: No match for E-Mail Address and/or Password."

  Scenario: Verify Login with empty credentials
    Given I am on the homepage
    When I click "My Account"
    And I click "Login"
    And I press "Login"
    Then I should see " Warning: No match for E-Mail Address and/or Password."