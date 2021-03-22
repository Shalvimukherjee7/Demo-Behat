<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Selector\CssSelector;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends \Drupal\DrupalExtension\Context\RawDrupalContext
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
     * @Given /^I click on wishlist$/
     */
    public function iClickOnWishlist()
    {
       $this->getSession()
       ->getPage()
       ->find('css', '[data-original-title="Add to Wish List"]')
       ->click();
    }

    /**
     * @Given /^I click on remove from wishlist$/
     */
    public function removeFromWishlist()
    {
       $this->getSession()
       ->getPage()
       ->find('css', '[data-original-title="Remove"]')
       ->click();
    }

    /**
     * @Given /^I click on add to cart$/
     */
    public function addToCartFromWishlist()
    {
       $this->getSession()
       ->getPage()
       ->find('css', '[data-original-title="Add to Cart"]')
       ->click();
    }
}
