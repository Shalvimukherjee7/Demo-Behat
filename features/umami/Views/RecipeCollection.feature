@javascript @umami @views @recipecollection
Feature: Recipe collection views

  Scenario: As admin I should be able to add, edit and delete a tag recipe collection
    #Add
    Given I am on the homepage
    When I login as admin
    And I visit "/en/admin/structure/taxonomy/manage/tags/overview"
    And I click "Add term"
    And I fill in "Name" with "Automated tag"
    And I fill in "URL alias" with "/tags/automatedtag"
    And I press "Save"
    Then I should see "Created new term Automated tag."
    When I am on the homepage
    Then I should see "Automated tag"
    When I click "Automated tag"
    Then I should be on "en/tags/automatedtag"

    #Edit
    When I visit "/en/admin/structure/taxonomy/manage/tags/overview"
    And I click "Edit" in the "Automated tag" row
    And I fill in "Name" with "Edited Automated tag"
    And I press "Save"
    Then I should see "Updated term Edited Automated tag."
    When I am on the homepage
    Then I should see "Edited Automated tag"
    When I click "Edited Automated tag"
    Then I should be on "en/tags/automatedtag"

    #Delete
    When I visit "/en/admin/structure/taxonomy/manage/tags/overview"
    And I click "Delete" in the "Edited Automated tag" row
    Then I should see "This action cannot be undone."
    And I press "Delete"
    Then I should see "Deleted term Edited Automated tag."
    When I am on the homepage
    Then I should not see "Edited Automated tag"
