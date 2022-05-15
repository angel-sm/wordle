
Feature: Create a new user
  In order to have users in the platform
  As a user with admin permissions
  I want to create a new user

  Scenario: A valid non existing user
    Given I send a POST request to "/user" with body:
    """
    {
      // todo: agrega los campos de tu entidad
    }
    """
    Then the response status code should be 201
    And the response should be empty
