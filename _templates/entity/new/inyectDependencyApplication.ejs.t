---
to: src/apps/levita/backend/dependency-injection/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/application.yaml 
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
services:
  Levita.MongoConfig:
    factory:
      class: ../../../../../contexts/levita/shared/infrastructure/persistence/mongo/MongoConfigFactory
      method: 'createConfig'

  Levita.ConnectionManager:
    factory:
      class: ../../../../../contexts/shared/infrastructure/persistence/mongo/MongoClientFactory
      method: 'createClient'
    arguments: ['levita', '@Levita.MongoConfig']

  Levita.<%= h.changeCase.pascal(Plural) %>.domain.<%= h.changeCase.pascal(Singular) %>Repository:
    class: ../../../../../contexts/levita/<%= h.changeCase.pascal(Plural) %>/infrastructure/persistence/Mongo<%= h.changeCase.pascal(Singular) %>Repository
    arguments: ['@Levita.ConnectionManager']

  Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator:
    class: ../../../../../contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/<%= h.changeCase.pascal(Singular) %>Creator
    arguments: ['@Levita.<%= h.changeCase.pascal(Plural) %>.domain.<%= h.changeCase.pascal(Singular) %>Repository']