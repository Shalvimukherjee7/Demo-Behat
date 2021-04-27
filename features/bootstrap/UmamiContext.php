<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Selector\CssSelector;
use \PHPUnit\Framework\Assert;

/**
 * Defines application features from the specific context.
 */
class UmamiContext extends \Drupal\DrupalExtension\Context\RawDrupalContext
{
    public $currenturl = null;
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given /^I login as admin$/
     */
    public function ilogin() {
      $this->visitPath("user/login");
      $this->getSession()
        ->getPage()
        ->findField("Username")
        ->setValue("admin"); 

      $this->getSession()
        ->getPage()
        ->findField("Password")
        ->setValue("admin"); 

      $this->getSession()
        ->getPage()
        ->findButton("Log in")
        ->click();
    }

  /**
   *
   * @Given I select :value from :field from autocomplete
   */
  public function enterTag($value, $field) {

    //Get the input field for tag
    $element=$this
      ->getSession()
      ->getPage()
      ->findField($field);

    //Enter the value of tag  
    $this->getSession()
      ->getPage()
      ->fillField($field, $value);
    
    //Get Xpath of the field 
    $xpath = $element->getXpath();
    $driver = $this
      ->getSession()
      ->getDriver();

    //press enter key 
    $driver->keyDown($xpath, 13);
   
  }
  /**
   * @Given /^I fill in "([^"]*)" field with following:$/
   */
  public function fillCKEditor($label, PyStringNode $value) {

    //Get text area present in CK Editor
    $element = $this->getSession()
      ->getPage()
      ->find('xpath', "//label[text()='{$label}']//parent::*//textarea");

    //Get id of CK editor instance  
    $ckEditorId = $element->getAttribute('id');
    
    //Replace new line
    $value = str_replace("\n", "<br>", $value);

    //Wait for CK editor javascript to load
    $this->getSession()
      ->wait(10000, "typeof CKEDITOR !== 'undefined'");

    //Wait for CK editor instance to load   
    $this->getSession()
      ->wait(10000, "CKEDITOR.instances['{$ckEditorId}'].status === 'ready'");

    //Enter value in CK editor  
    $this->getSession()
      ->executeScript("CKEDITOR.instances['{$ckEditorId}'].setData('{$value}')");
    
    //Wait for the value to get reflected in the text area  
    sleep(1);

  }

  /**
   *
   * @Given /^I click on insert selected media$/
   */
  public function clickApplyFilters() {
    $this->getSession()
      ->getPage()
      ->find('xpath', '//div[@class="ui-dialog-buttonset form-actions"]//button[text()="Insert selected"]')
      ->click();
  }

  /**
   * @Then /^The current state should be "([^"]*)"$/
   */
  public function currentState($state){
    $this->assertSession()
     ->elementTextContains('xpath',"//select[@id='edit-moderation-state-0-state']/option[@selected='selected']", $state);
  }

  /**
   * @Given /^I logout$/
   */
  public function ilogout() {
    $this->visitPath("/user/logout");
  }

  /**
   * @Given /^I get the current url$/
   */
  public function getCurrentUrl() {
    $this->currenturl= $this->getSession()
     ->getCurrentUrl();
    $this->visitPath($this->currenturl);
  }

  /**
   * @Given /^I visit the page$/
   */
  public function visitPage() {
    $this->visitPath($this->currenturl);
  }

}
