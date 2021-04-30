@javascript @umami @contenttype
Feature: Recipe page

  Scenario: As admin I should be able to add, edit and delete recipe page
    #add
    Given I am on the homepage
    When I login as admin
    And I visit "/en/node/add/recipe"
    And I fill in "Recipe Name" with "[Test] Automated Recipe"
    And I fill in "Preparation time" with "30"
    And I fill in "Cooking time" with "120"
    And I fill in "Number of servings" with "4"
    And I select "Hard" from "Difficulty"
    And I select "Main courses" from "Recipe category" from autocomplete
    And I select "Baked" from "Tags" from autocomplete
    And I fill in "Summary" field with following:
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
    """
    And I fill in "Ingredients (value 1)" with "Ingredient 1"
    And I press "Add another item"
    And I fill in "Ingredients (value 2)" with "Ingredient 2"
    And I press "Add media"
    And I fill in "Name" with "Deep mediterranean quiche"
    And I press "Apply filters"
    And I check "Select Deep mediterranean quiche"
    And I click on insert selected media 
    And I fill in "Recipe instruction" field with following:
    """
    Dummy recipe instruction
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Don
    """
    And I select "Published" from "Save as"
    And I press "Save"
    Then I should see "Recipe [Test] Automated Recipe has been created."
    And I should see the heading "[Test] Automated Recipe"
    And I should see "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    And I should see "Baked"
    And I should see "Main courses"
    And I should see "Dummy recipe instruction"
    And I should see "Ingredient 1"
    And I should see "Ingredient 2"
    And I should see "30 minutes"
    And I should see "120 minutes"
    And I should see "Hard"

    #edit
    When I click "Edit" in the "content" region
    And I fill in "Recipe Name" with "[Test] Edit Automated Recipe"
    And I fill in "Summary" field with following:
    """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    """
    And I select "Medium" from "Difficulty"
    And I fill in "Recipe instruction" field with following:
    """
    Edited Dummy recipe instruction
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Don
    """
    And I press "Save"
    Then I should see "Recipe [Test] Edit Automated Recipe has been updated."
    And I should see the heading "[Test] Edit Automated Recipe"
    And I should see "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    And I should see "Edited Dummy recipe instruction"
    And I should see "Medium"

    #delete
    When I click "Delete" in the "content" region
    Then I should see "This action cannot be undone."
    And I press "Delete"
    Then I should see "The Recipe [Test] Edit Automated Recipe has been deleted."

  Scenario: As admin I should enable/disable promoted to front page functionality
    #Enable
    Given I am on the homepage
    When I login as admin
    And I visit "/en/node/add/recipe"
    And I fill in "Recipe Name" with "[Test] Automated Promoted Recipe"
    And I fill in "Preparation time" with "30"
    And I fill in "Number of servings" with "4"
    And I select "Hard" from "Difficulty"
    And I fill in "Summary" field with following:
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Donec a dui et dui fringilla consectetur id nec Nunc posuere purus rhoncus pulvinar aliquam massa.
    """
    And I press "Add media"
    And I fill in "Name" with "Deep mediterranean quiche"
    And I press "Apply filters"
    And I check "Select Deep mediterranean quiche"
    And I click on insert selected media 
    And I fill in "Recipe instruction" field with following:
    """
    Dummy recipe instruction
    Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam.
    Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis.
    Don
    """
    And I should see "(Promoted to front page)"
    And I select "Published" from "Save as"
    And I press "Save"
    Then I should see "Recipe [Test] Automated Promoted Recipe has been created."
    When I am on the homepage
    Then I should see "[Test] Automated Promoted Recipe"
    When I click on "[Test] Automated Promoted Recipe" view recipe link

    #Disable
    And I click "Edit" in the "content" region
    And I uncheck "Promoted to front page"
    And I press "Save"
    When I am on the homepage
    Then I should not see "[Test] Automated Promoted Recipe"
