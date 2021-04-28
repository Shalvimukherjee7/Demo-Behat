@javascript @umami @menu
Feature: Main Navigation menu

  Scenario: As admin I should be able to add, edit and delete main navigation menu
   #add
   Given I am on the homepage
   When I login as admin
   Then I should see "Log out"
   When I visit "en/admin/structure/menu/manage/main?destination=/en/admin/structure/menu"
   And I click "Add link"
   And I fill in "Menu link title" with "[Test]AutomatedLink"
   And I fill in "Link" with "/en/tags/grow-your-own"
   And I press "Save"
   Then I should see "The menu link has been saved."
   When I am on the homepage
   Then I should see "[Test]AutomatedLink"
   When I click "[Test]AutomatedLink"
   Then I should see "Give it a go and grow your own herbs"

   #edit
   When I visit "en/admin/structure/menu/manage/main?destination=/en/admin/structure/menu"
   And I perform "Edit" action on the "[Test]AutomatedLink" menu
   And I fill in "Menu link title" with "[Test]EditedAutomatedLink"
   And I press "Save"
   Then I should see "The menu link has been saved."
   When I am on the homepage
   Then I should see "[Test]EditedAutomatedLink"
   When I click "[Test]EditedAutomatedLink"
   Then I should see "Give it a go and grow your own herbs"

   #delete
   When I visit "en/admin/structure/menu/manage/main?destination=/en/admin/structure/menu"
   And I perform "Delete" action on the "[Test]EditedAutomatedLink" menu
   Then I should see "This action cannot be undone."
   And I press "Delete"
   Then I should see "The menu link [Test]EditedAutomatedLink has been deleted."
