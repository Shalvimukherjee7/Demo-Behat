@javascript
Feature: Edit account functionality

  Scenario: Verify edit account link
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    When I click "Edit Account"
    Then I should see "My Account Information"

  Scenario: Verify on clearing the first name field
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I click "Edit Account"
    When I fill in "firstname" with ""
    And I press "Continue"
    Then I should see "First Name must be between 1 and 32 characters!"

  Scenario: Verify on clearing the last name field
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I click "Edit Account"
    When I fill in "lastname" with ""
    And I press "Continue"
    Then I should see "Last Name must be between 1 and 32 characters!"

  Scenario: Verify on clearing the email field
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I click "Edit Account"
    When I fill in "email" with ""
    And I press "Continue"
    Then I should see "E-Mail Address does not appear to be valid!"

  Scenario: Verify on clearing the telephone field
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I click "Edit Account"
    When I fill in "telephone" with ""
    And I press "Continue"
    Then I should see "Telephone must be between 3 and 32 characters!"