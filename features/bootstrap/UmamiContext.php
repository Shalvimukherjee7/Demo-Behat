<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Selector\CssSelector;
use \PHPUnit\Framework\Assert;
use Symfony\Component\Yaml\Yaml;

/**
 * Defines application features from the specific context.
 */
class UmamiContext extends \Drupal\DrupalExtension\Context\RawDrupalContext
{
    public $currenturl = null;
    public $lang = null;
    public $yml = null;
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct($lang)
    {
      $this->yml = Yaml::parse(file_get_contents('testData/Mapping.yml'));
      $this->lang = $lang;
    }

    /**
     * @Given /^I login as admin$/
     */
    public function ilogin() {
      $userName = $this->localize("Username");
      $password = $this->localize("Password");
      $login = $this->localize("Login");
      $logout = $this->localize("Logout");

      $this->visitPath("user/login");
      $this->getSession()
        ->getPage()
        ->findField($userName)
        ->setValue("admin"); 

      $this->getSession()
        ->getPage()
        ->findField($password)
        ->setValue("admin"); 

      $this->getSession()
        ->getPage()
        ->findButton($login)
        ->click();

      $this->assertSession()
        ->pageTextContains($logout);
    }

  /**
   *
   * @Given I select :value from :field from autocomplete
   */
  public function enterTag($value, $field) {
    $field = $this->localize($field);

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
    $label = $this->localize($label);

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
   * @Given /^I save current URL$/
   */
  public function getCurrentUrl() {
    $this->currenturl= $this->getSession()
     ->getCurrentUrl();
    $this->visitPath($this->currenturl);
  }

  /**
   * @Given /^I navigate to saved URL$/
   */
  public function visitPage() {
    $this->visitPath($this->currenturl);
  }
  
  /**
   * @Given /^I fill in search field with "([^"]*)"$/
   */
  public function getSearchField($value)
  {
    $this->getSession()
     ->getPage()
     ->find('css','#edit-keys')->setValue("{$value}");
  } 

   /**
    * Wait for a specified time until an element is found.
    *
    * @param $selector -  Selectors like css path, xpath path, label etc.
    * @param string $type - Type of Mink Selector css, xpath, named etc.
    * @param int $wait - Max wait time.
    */
  public function waitForElement($selector, $type = 'css', $wait = 15) {
    // Wait until max timeout.
    while ($wait > 0) {
      // Check for Element.
      $element = $this->getSession()->getPage()->find($type, $selector);
      if (!is_null($element)) {
        return $element;
      }
      else {
        // Wait for 1 sec and continue.
        sleep(1);
        $wait--;
      }
    }
    return false;
  }

  public function waitForAjaxAndAnimation($wait = 30) {
    $this->getSession()
      ->wait($wait, "(jQuery.active === 0)");
  }

  /**
   * @Given /^I upload "([^"]*)" image in add media field$/
   */
  public function uploadImage($file) {

    //Click on Add media button
    $this->getSession()
     ->getPage()
     ->find('xpath',"//span[text()='Media Image']//../..//input[@id='edit-field-media-image-open-button']")
     ->click();

    $this->waitForElement('[name="files[upload]"]');

    //Upload the image
    if ($this->getMinkParameter('files_path')) {
      $fullPath = rtrim(realpath($this->getMinkParameter('files_path')), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$file;
      if (is_file($fullPath)) {
          $file = $fullPath;
        }
    }

    $this->getSession()
     ->getPage()
     ->attachFileToField('files[upload]', $file);

    $this->waitForElement('[name="media[0][fields][name][0][value]"]');

    //Enter Alternative text
    $this->getSession()
     ->getPage()
     ->find('xpath',"//label[text()='Alternative text']//parent::div//input[@name='media[0][fields][field_media_image][0][alt]']")
     ->setValue('demoimage');

    //Click on Save 
    $this->getSession()
      ->getPage()
      ->find('xpath', "//button[text()='Save']")
      ->click();

    $this->waitForAjaxAndAnimation();

    //Click on insert selected button
    $this->waitForElement('//div[@class="ui-dialog-buttonset form-actions"]//button[text()="Insert selected"]', "xpath")
     ->click();

    $this->waitForAjaxAndAnimation();
  }
  /**
   * @Given /^I click on "([^"]*)" view recipe link$/
   */
  public function clickViewRecipe($value)
  {
    $this->getSession()
     ->getPage()
     ->find("xpath", "//h2//*[text()='{$value}']//../..//*[@class='read-more__link']")
     ->click();
  }   
 
  /**
   * @Given /^I fill in "([^"]*)" with "([^"]*)" text$/
   */
  public function fillField($label, $value){
    $label = $this->localize($label);
    $this->getSession()
      ->getPage()
      ->findField($label)
      ->setValue($value);
  }

  /**
   * @Given /^I press "([^"]*)" button$/
   */
  public function iPressButton($label){
    $label = $this->localize($label);
    $this->getSession()
      ->getPage()
      ->findButton($label)
      ->click();
  }

  //Translates the input into desired language
  public function localize($text){
    $language = $this->lang;
    $label= $this->yml[$text][$language];
    return $label;
  }

  /**
   * @When /^I select "([^"]*)" from dropdown$/
   */
  public function selectOption($option){
    $option = $this->localize($option);
    $this->getSession()
      ->getPage()
      ->find('xpath', "//select[@id='edit-moderation-state-0-state']/option[text()='$option']")
      ->click();
  }

  /**
   * @Then /^I should see "([^"]*)" message$/
   */
  public function deleteWarningMessage($text){
    $text = $this->localize($text);
    $this->assertSession()
      ->elementContains('css','#node-page-delete-form',$text);
  }

  /**
   * @When /^I click on "([^"]*)" link on region tab$/
   */
  public function clickOnLink($link){
    $link = $this->localize($link);
    $this->getSession()
      ->getPage()
      ->find('xpath', "//div[@class='region region-tabs']//*[text()='{$link}']")
      ->click();
  }

  /**
    * @Then I should see following message :prefix :text :suffix
    */
  public function updateMessage($prefix, $text, $suffix){
    $prefix = $this->localize($prefix);
    $suffix = $this->localize($suffix);
    $this->assertSession()
      ->pageTextContains($prefix." ".$text." ".$suffix);
  }

}
