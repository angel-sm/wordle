
Feature: Create a new game
  In order to have games in the platform
  As a user with admin permissions
  I want to create a new game

  Scenario: A valid non existing game
    Given I send a POST request to "/game" with body:
    """
    {
      // todo: agrega los campos de tu entidad
    }
    """
    Then the response status code should be 201
    And the response should be empty
