@javascript
Feature: wishlist functionality
  Background: Login as user
    Given I am on the homepage
    When I visit "?route=account/login"
    And I fill in "email" with "shalvi.mukherjee@qed42.com"
    And I fill in "password" with "admin"
    And I press "Login"

  Scenario: Add to wishlist
    Given I am on the homepage
    When I visit "?route=product/search&search=iphone"
    And I click on wishlist
    Then I should see "Success: You have added iPhone to your wish list!"

  Scenario: Remove from wishlist
    Given I am on the homepage
    And I visit "?route=product/search&search=iphone"
    And I click on wishlist
    When I visit "?route=account/wishlist"
    And I click on remove from wishlist
    Then I should see "Success: You have modified your wish list!"

  Scenario: Add to cart from wishlist
    Given I am on the homepage
    And I visit "?route=product/search&search=iphone"
    And I click on wishlist
    When I visit "?route=account/wishlist"
    And I click on add to cart from wishlist
    Then I should see "Success: You have added iPhone to your shopping cart!"