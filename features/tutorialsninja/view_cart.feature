@javascript
Feature: Cart functionality
  Background: Login as user
    Given I am on the homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"
    And I visit "?route=common/home"
    And I click on add to cart "1"
    
@addtocart
Scenario: Verify user is able to update the quantity of product in cart
    Given I am on the homepage
    And I visit "?route=checkout/cart"
    When I update the quantity of product to "2"
    Then I should see "Success: You have modified your shopping cart!"

Scenario: Verify user is able to delete the product from cart
    Given I am on the homepage
    And I visit "?route=checkout/cart"
    When I delete the product from cart
    Then I should see "Your shopping cart is empty!"

@addtocart
Scenario: Verify click of continue shopping button
    Given I am on the homepage
    And I visit "?route=checkout/cart"
    When I click "Continue Shopping"
    Then I should see "Featured"  

@addtocart
Scenario: Verify click of checkout button in cart pop
   Given I am on the homepage
    And I visit "?route=checkout/cart"
    And I press "Checkout"
    Then I should see "Checkout Options" 