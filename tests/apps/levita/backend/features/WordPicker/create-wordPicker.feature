
Feature: Create a new wordPicker
  In order to have wordPickers in the platform
  As a user with admin permissions
  I want to create a new wordPicker

  Scenario: A valid non existing wordPicker
    Given I send a POST request to "/wordPicker" with body:
    """
    {
      // todo: agrega los campos de tu entidad
    }
    """
    Then the response status code should be 201
    And the response should be empty
