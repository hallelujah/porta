@ignore-backend @javascript
Feature: Provider's invoices
  In order to manage invoices
  As a provider
  I want to be able to see all invoices issued by me

  Background:
    Given a provider is logged in on 1st January 2011
    And the provider is charging its buyers in prepaid mode
    And a buyer "zoidberg" signed up to provider "foo.3scale.localhost"

  Scenario: Display years of invoices when there are invoices
    Given an invoice of buyer "zoidberg" for January, 2011
    And an invoice of buyer "zoidberg" for January, 2014 on 1st January 2014 (without scheduled jobs)
    When the provider is at all provider's invoices page
    Then invoices can be filtered by the following years:
      |      |
      | 2014 |
      | 2013 |
      | 2012 |
      | 2011 |

  Scenario: Display the current year when there are no invoices
    When the provider is at all provider's invoices page
    Then invoices can be filtered by the following years:
      |      |
      | 2011 |

  Scenario: Display only years belonging to the current provider
    Given an invoice of buyer "zoidberg" for January, 2011
    And a provider "bar.3scale.localhost"
    And provider "bar.3scale.localhost" is charging its buyers
    And a buyer "leela" signed up to provider "bar.3scale.localhost"
    And an invoice of buyer "leela" for January, 2012
    When the provider is at all provider's invoices page
    Then invoices can be filtered by the following years:
      |      |
      | 2011 |
