@javascript
Feature: View cart functionality
  Background: Login as user
    Given I am on the homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I visit "?route=common/home"
    And I click on add to cart "1"
    When I press cart total button
    And I click "View Cart"
    
@addtocart
Scenario: Verify click of view cart button in  cart pop
    Given I am on the homepage
    # And I click on add to cart "1"
    # When I press cart total button
    # And I click "View Cart"
    Then I should see "What would you like to do next"

