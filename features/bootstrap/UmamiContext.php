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
    $element=$this
      ->getSession()
      ->getPage()
      ->findField($field);

    $this->getSession()
      ->getPage()
      ->fillField($field, $value);
    
     $xpath = $element->getXpath();
     $driver = $this
      ->getSession()
      ->getDriver();

     $driver->keyDown($xpath, 13);
   
  }
  /**
   * @Given /^I fill in "([^"]*)" field with following:$/
   */
  public function fillCKEditor($label, PyStringNode $value) {

    $element = $this->getSession()
      ->getPage()
      ->find('xpath', "//label[text()='{$label}']//parent::*//textarea");

    $ckEditorId = $element->getAttribute('id');
    $value = str_replace("\n", "<br>", $value);

    $this->getSession()
      ->wait(10000, "typeof CKEDITOR !== 'undefined'");

    $this->getSession()
      ->wait(10000, "CKEDITOR.instances['{$ckEditorId}'].status === 'ready'");

    $this->getSession()
      ->executeScript("CKEDITOR.instances['{$ckEditorId}'].setData('{$value}')");
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

}
