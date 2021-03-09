Feature: Forgot password functionality

  Scenario: Verify Forgotten Password link
    Given I am on the homepage
    When I click "My Account"
    And I click "Login"
    And I click "Forgotten Password"
    Then I should see "Forgot Your Password?"

  Scenario: Verify with empty email in forgot password page
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I click "Forgotten Password"
    When I press "Continue"
    Then I should see " Warning: The E-Mail Address was not found in our records, please try again!"


  Scenario: Verify with invalid email in forgot password page
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I click "Forgotten Password"
    When I fill in "email" with "abc@xy.com"
    And I press "Continue"
    Then I should see "Warning: The E-Mail Address was not found in our records, please try again!"