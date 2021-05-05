@javascript @umami @contenttype
Feature: Basic page

  Scenario: As admin I should be able to add, edit and delete Basic page
    #add
    Given I am on the homepage
    When I login as admin
    And I visit "node/add/page"
    And I fill in "Title" with "[Test] Automated Basic Page" text
    
    And I fill in "Body" field with following:
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
    """
    And I select "Published" from dropdown
    And I press "Save" button
    Then I should see following message "Basic page" "[Test] Automated Basic Page" "has been created."
    Then I should see the heading "[Test] Automated Basic Page"
    And I should see "Lorem ipsum dolor sit amet, consectetur adipiscing elit"

    #edit
    When I click "Edit" in the "content" region
    And I fill in "Title" with "[Test] Edit Automated Basic Page" text
    And I fill in "Body" field with following:
    """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    """
    And I press "Save" button
    Then I should see following message "Basic page" "[Test] Edit Automated Basic Page" "has been updated."
    Then I should see the heading "[Test] Edit Automated Basic Page"
    And I should see "Lorem Ipsum is simply dummy text of the printing and typesetting industry."

    #delete
    When I click on "Delete" link on region tab
    Then I should see "Delete warning" message
    And I press "Delete" button
    Then I should see following message "The Basic page" "[Test] Edit Automated Basic Page" "has been deleted."
