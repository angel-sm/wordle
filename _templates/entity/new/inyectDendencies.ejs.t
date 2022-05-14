---
inject: true
to: src/apps/levita/backend/dependency-injection/application.yaml
after: "imports:"
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
  - { resource: ./apps/<%= h.changeCase.camel(Singular) %>.yaml }
  - { resource: ./<%= h.changeCase.pascal(Plural) %>/application.yaml }
