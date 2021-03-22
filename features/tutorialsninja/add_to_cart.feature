@javascript
Feature: Add to cart popup functionality
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
    Then I should see total "1" products in cart popup

  @addtocart
  Scenario: Add two products to cart and verify popup
    Given I am on the homepage
    When I click on add to cart "1"
    And I click on add to cart "2"
    Then I should see total "2" products in cart popup