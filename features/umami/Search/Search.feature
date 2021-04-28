@javascript @umami @search
Feature: Search functionality

  Scenario: Search for a valid keyword
    Given I am on the homepage
    When I fill in search field with "thai curry"
    And I press "Search"
    Then I should see "About searching"
    And I should be on "en/search/node?keys=thai+curry"
    And I should see "Thai green curry"

  Scenario: Search for a invalid keyword
    Given I am on the homepage
    When I fill in search field with "Invalid keyword"
    And I press "Search"
    Then I should see "About searching"
    And I should be on "en/search/node?keys=Invalid+keyword"
    And I should see "Your search yielded no results."  

  Scenario: Click on search without entering any keyword
    Given I am on the homepage
    When I press "Search"
    Then I should see "About searching"
    And I should be on "en/search/node?keys="
    And I should see "Please enter some keywords."
