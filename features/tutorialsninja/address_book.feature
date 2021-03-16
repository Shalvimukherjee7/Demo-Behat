@javascript
Feature: Address book functionality
  Background: Login as user
    Given I am on homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"

  Scenario: Address Book error case
    When I visit "?route=account/address/add"
    And I fill in the following:
      | First Name   | Shalvi |
      | Last Name    | Mukherjee |
      | Company      | QED42 |
      | Address 1    | Palava |
      | City         | Mumbai |
      | Post Code    | 421204 |
    And I press "Continue"
    Then I should see "Please select a region / state!"

  Scenario: Add address
    When I visit "?route=account/address/add"
    And I fill in the following:
      | First Name   | Shalvi |
      | Last Name    | Mukherjee |
      | Company      | QED42 |
      | Address 1    | Palava |
      | City         | Mumbai |
      | Post Code    | 421204 |
    And I select "Anglesey" from "input-zone"
    And I press "Continue"
    Then I should see "Your address has been successfully added"