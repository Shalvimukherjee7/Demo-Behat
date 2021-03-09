Feature: Wiki Search

  Scenario: to test the search of wiki
    Given I am on the homepage
    When I fill in "searchInput" with "Gherkin Language"
    And I press "searchButton"
    Then I should see "Gherkin Language"