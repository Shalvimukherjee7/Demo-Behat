@javascript
Feature: Newsletter functionality

  Scenario: Verify newsletter link
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    When I click "Newsletter"
    Then I should see " Newsletter Subscription"

  Scenario: Verify on unsubscribe
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    When I click "Newsletter"
    And I click "No"
    And print current URL
    And I press "Continue"
    Then I should see " Success: Your newsletter subscription has been successfully updated!"


  Scenario: Verify on subscribe
    Given I am on the homepage
    And I click "My Account"
    And I click "Login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    When I click "Newsletter"
    And print current URL
    And I click "Yes"
    And print current URL
    And I press "Continue"
    Then I should see " Success: Your newsletter subscription has been successfully updated!"

