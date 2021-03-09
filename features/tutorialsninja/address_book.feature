@javascript
Feature: Address book functionality
  Background: Login as user
    Given I am on homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"

  Scenario: Address Book

    When I visit "?route=account/address/add"
#    When I fill in "First Name" with "Admin"
#    When I fill in "Last Name" with "Test"
#    When I fill in "Company" with "XYZ"
#    When I fill in "Address 1" with "131 superior Avenue Chicago"
#    When I fill in "Address 2" with "Chicago"
#    When I fill in "City" with "Chicago"
#    When I fill in "Post Code" with "411663"
#    When I press "country_id"
#    Then I press "223"
#    When I press "zone_id"
#    Then I Press "3635"
#    When I fill in "Default Address" with "Admin"d" with "admin123"
 #   And I press "Login"
    And I fill in the following:
      | First Name   | Shalvi |
      | Last Name    | Mukherjee |
      | Company      | QED42 |
      | Address 1    | Palava |
      | City         | Mumbai |
      | Post Code    | 421204 |
    And I press "Continue"
    Then I should see "Please select a region / state!"

