@javascript
Feature: Cart functionality
  Background: Login as user
    Given I am on the homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"

  @addtocart
  Scenario: Add one product to cart and verify popup
    Given I am on the homepage
    When I click on add to cart "1"
    Then I should see product count "1"
   
  @addtocart
  Scenario: Add two products to cart and verify popup
    Given I am on the homepage
    When I click on add to cart "1"
    And I click on add to cart "2"
    Then I should see product count "2"

  @removefromcart
  Scenario: Remove product from cart
    Given I am on the homepage
    And I click on add to cart "1"
    When I remove item from cart
    And I wait for AJAX to finish
    Then I should see product count "0"  
