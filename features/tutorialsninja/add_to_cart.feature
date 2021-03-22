@javascript
Feature: Add to cart functionality
  Background: Login as user
    Given I am on the homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"

  Scenario: Check count when no item is added to cart
    Given I am on the homepage
    Then I should see product count "0"  

  Scenario: Check cart message no item is added to cart
    Given I am on the homepage
    When I press cart total button
    Then  I should see "Your shopping cart is empty!"   
  
  Scenario: Remove product from cart
    Given I am on the homepage
    And I click on add to cart "1"
    When I remove item from cart
    And I wait for AJAX to finish
    Then I should see product count "0"     

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

  @addtocart
  Scenario: Verify click of view cart button in cart pop
    Given I am on the homepage
    And I click on add to cart "1"
    When I press cart total button
    And I click "View Cart"
    Then I should see "What would you like to do next"   
 
  @addtocart
  Scenario: Verify click of checkout button in cart pop
    Given I am on the homepage
    And I click on add to cart "1"
    When I press cart total button
    And I click "Checkout"
    Then I should see "Checkout Options" 