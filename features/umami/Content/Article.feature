@javascript @umami @contenttype
Feature: Article page

  Scenario: As admin I should be able to add, edit and delete article page
    #add
    Given I am on the homepage
    When I login as admin
    And I visit "/en/node/add/article"
    And I fill in "Title" with "[Test] Automated Article page"
    
    And I fill in "Body" field with following:
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
    """
    And I select "Baked" from "Tags" from autocomplete
    And I upload "demoimage.png" image in add media field
    And I select "Published" from "Save as"
    And I press "Save"
    Then I should see "Article [Test] Automated Article page has been created."
    And I should see the heading "[Test] Automated Article page"
    And I should see "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    And I should see "Baked"

    #edit
    When I click "Edit" in the "content" region
    And I fill in "Title" with "[Test] Edit Automated Article page"
    And I fill in "Body" field with following:
    """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    """
    And I press "Save"
    Then I should see "Article [Test] Edit Automated Article Page has been updated."
    And I should see the heading "[Test] Edit Automated Article page"
    And I should see "Lorem Ipsum is simply dummy text of the printing and typesetting industry."

    #delete
    When I click "Delete" in the "content" region
    Then I should see "This action cannot be undone."
    And I press "Delete"
    Then I should see "The Article [Test] Edit Automated Article page has been deleted."

  Scenario: As admin I should enable/disable promoted to front page functionality
    #Enable
    Given I am on the homepage
    When I login as admin
    And I visit "/en/node/add/article"
    And I fill in "Title" with "[Test] Automated Promoted Article page"
    
    And I fill in "Body" field with following:
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
    """
    And I select "Baked" from "Tags" from autocomplete
    And I press "Add media"
    And I fill in "Name" with "Deep mediterranean quiche"
    And I press "Apply filters"
    And I check "Select Deep mediterranean quiche"
    And I click on insert selected media 
    And I select "Published" from "Save as"
    And I should see "(Promoted to front page)"
    And I press "Save"
    Then I should see "Article [Test] Automated Promoted Article page has been created."
    When I am on the homepage
    Then I should see "[Test] Automated Promoted Article page"
    When I click "View Article"

    #Disable
    And I click "Edit" in the "content" region
    And I uncheck "Promoted to front page"
    And I press "Save"
    When I am on the homepage
    Then I should not see "[Test] Automated Promoted Article page"
