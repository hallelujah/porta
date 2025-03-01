@javascript
Feature: Backend API edit page

  Background:
    Given a provider is logged in

  Scenario: Edit an existing backend API
    Given an admin is at a backend api edit page
    Then they will be able to edit the name, description and base url
    But will not be able to edit its system name

  Scenario: Form validation
    Given an admin is at a backend api edit page
    Then they will not be able to update it without a name
    And they will not be able to update it without a valid url

  Scenario: Edit a backend API with duplicate fields
    Given an admin is at a backend api edit page
    Then they will be able to update it with an existing name and url

  Scenario: Delete a backend API used by product
    Given a backend
    And a product
    And the backend is used by this product
    When an admin tries to delete the backend api from its edit page
    Then it is not possible to delete the backend

  Scenario: Delete a backend API not used by any product
    Given a backend
    When an admin tries to delete the backend api from its edit page
    Then it is possible to delete the backend
