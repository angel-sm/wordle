---
to: src/apps/levita/backend/dependency-injection/apps/<%= h.changeCase.camel(h.inflection.singularize(name)) %>.yaml 
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
services:
  Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>GetAllController:
    class: ../../controllers/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>GetAllController
    arguments: ["@Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator"]
    
  Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>GetOneController:
    class: ../../controllers/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>GetOneController
    arguments: ["@Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator"]

  Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>PostController:
    class: ../../controllers/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>PostController
    arguments: ["@Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator"]
    
  Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>PutController:
    class: ../../controllers/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>PutController
    arguments: ["@Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator"]
 
  Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>DeleteController:
    class: ../../controllers/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>DeleteController
    arguments: ["@Levita.<%= h.changeCase.pascal(Plural) %>.application.<%= h.changeCase.pascal(Singular) %>Creator"]