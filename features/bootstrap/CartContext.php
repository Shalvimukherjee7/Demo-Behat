<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Selector\CssSelector;
use PHPUnit\Framework\Assert;

/**
 * Defines application features from the specific context.
 */
class CartContext extends \Drupal\DrupalExtension\Context\RawDrupalContext
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
       $this->getSession()
         ->getPage()
         ->find('xpath', "//div[@id='content']//div[$index]/div[1]/div[3]/button[1]")
         ->click();
        
    }

    /**
     * @Given /^I open cart popup$/
     */
    public function cartTotalButton()
    {
       $this->getSession()
         ->getPage()
         ->find('xpath', "//span[@id='cart-total']")
         ->click();
    }

    /**
     * @Given /^I should see total "([^"]*)" products in cart popup$/
     */
    public function cartTotalCount($index)
    {
      printf($this->getSession()->getPage()->find('xpath',"//span[@id='cart-total']")->getText());
      $this->assertSession()->elementTextContains('xpath', "//span[@id='cart-total']",$index ." item(s)");
    }
    
     /**
     * @Given /^I remove item from cart$/
     */
    public function removeItemFromCart()
    {
       $this->getSession()
         ->getPage()
         ->find('css',".btn-danger")
         ->click();
    }

    /** @AfterScenario @addtocart */
    public function after()
    {
      $elements=$this->getSession()
         ->getPage()
         ->findAll('css',"[title='Remove']");
      foreach($elements as $value){
       $value=$this->getSession()
         ->getPage()
         ->find('xpath',"//div[@id='cart']//tr[1]//button")
         ->click();
      }
   }
}