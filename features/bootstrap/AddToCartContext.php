<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Selector\CssSelector;
use \PHPUnit\Framework\Assert;
use PHPUnit\Framework\TestCase; 

/**
 * Defines application features from the specific context.
 */
class AddToCartContext extends \Drupal\DrupalExtension\Context\RawDrupalContext
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
     * @Given /^I click on add to cart "([^"]*)"$/
     */
    public function addToCart($index)
    {
       $this->getSession()->getPage()->find('xpath', "//div[@id='content']/div[2]/div[$index]/div[1]/div[3]/button[1]")->click();
        
    }

    /**
     * @Given /^I press cart total button$/
     */
    public function cartTotalButton()
    {
       $this->getSession()->getPage()->find('xpath', "//span[@id='cart-total']")->click();
    }

    /**
     * @Given /^I should see product count "([^"]*)"$/
     */
    public function cartTotalCount($index)
    {
       $this->assertSession()->elementTextContains('xpath', "//span[@id='cart-total']",$index ." item(s)");
    }

    /** @AfterScenario */
    public function after()
    {
        $elements=$this->getSession()->getPage()->findAll('css',".btn-danger");
        foreach($elements as $value){
        $value->click();
    
        }
    }
}