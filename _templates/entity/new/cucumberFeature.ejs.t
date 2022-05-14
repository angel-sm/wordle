---
to: tests\apps\levita\backend\features\<%= h.changeCase.pascal( h.inflection.singularize(name)) %>\create-<%= h.changeCase.camel( h.inflection.singularize(name)) %>.feature 
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
Feature: Create a new <%= h.changeCase.camel(Singular) %>
  In order to have <%= h.changeCase.camel(Plural) %> in the platform
  As a user with admin permissions
  I want to create a new <%= h.changeCase.camel(Singular) %>

  Scenario: A valid non existing <%= h.changeCase.camel(Singular) %>
    Given I send a POST request to "/<%= h.changeCase.camel(Singular) %>" with body:
    """
    {
      // todo: agrega los campos de tu entidad
    }
    """
    Then the response status code should be 201
    And the response should be empty
