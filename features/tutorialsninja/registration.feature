@javascript
Feature: Registration functionality

  Scenario: Verify Registration with all empty fields
    Given I am on the homepage
    When I click "My Account"
    And I click "Register"
    And I press "Continue"
    Then I should see "First Name must be between 1 and 32 characters!"
    And I should see "Last Name must be between 1 and 32 characters!"
    And I should see "E-Mail Address does not appear to be valid!"
    And I should see "Telephone must be between 3 and 32 characters!"
    And I should see "Password must be between 4 and 20 characters!"

  Scenario: Verify Registration with telephone number less than 3 characters
    Given I am on the homepage
    When I click "My Account"
    And I click "Register"
    And I fill in "firstname" with "shalvi"
    And I fill in "lastname" with "mukherjee"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "telephone" with "12"
    And I fill in "password" with "admin"
    And I fill in "confirm" with "admin"
    And I press "Continue"
    Then I should see " Telephone must be between 3 and 32 characters!"

