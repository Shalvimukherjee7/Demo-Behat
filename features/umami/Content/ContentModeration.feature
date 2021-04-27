@javascript @content @contentworkflow @umami
Feature: Verify content moderation workflow

    Scenario: Verify content moderation workflow on Basic page
        #Draft
        Given I am on the homepage
        When I login as admin
        Then I should see "Log out"
        When I visit "/en/node/add/page"
        And I fill in "Title" with "[Test] Automated Basic Page"
        
        And I fill in "Body" field with following:
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit
        Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
        Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
        Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
        """
        Then The current state should be "Draft"
        And I should see "Published"
        And I press "Save"
        When I get the current url
        And  I logout
        And I visit the page
        Then I should see "You are not authorized to access this page."

        #Published
        When I login as admin
        And I visit the page
        And I click "Edit" in the "content" region
        Then The current state should be "Draft"
        When I select "Published" from "Change to"
        And I press "Save"
        And I get the current url
        And I logout
        And I visit the page
        Then I should see the heading "[Test] Automated Basic Page"

        #Archived
        When I login as admin
        And I visit the page
        And I click "Edit" in the "content" region
        Then The current state should be "Published"
        When I select "Archived" from "Change to"
        And I press "Save"
        When I get the current url
        And I logout
        And I visit the page
        Then I should see "You are not authorized to access this page."

Scenario: Verify content moderation state by default on Recipe
        Given I am on the homepage
        When I login as admin
        And I visit "/en/node/add/recipe"
        Then The current state should be "Draft"

Scenario: Verify content moderation state by default on Article page
        Given I am on the homepage
        When I login as admin
        And I visit "/en/node/add/article"
        Then The current state should be "Draft"