---
to: src/contexts/levita/<%= h.changeCase.camel(h.inflection.pluralize(name)) %>/infrastructure/persistence/typeorm/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Entity.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { EntitySchema } from 'typeorm';
import { <%= h.changeCase.pascal(Singular) %> } from '../../../domain/<%= h.changeCase.pascal(Singular) %>';

export const <%= h.changeCase.pascal(Singular) %>Entity = new EntitySchema<<%= h.changeCase.pascal(Singular) %>>({
  name: '<%= h.changeCase.pascal(Singular) %>',
  tableName: '<%= h.changeCase.camel(Plural) %>',
  target: <%= h.changeCase.pascal(Singular) %>,
  columns: {
    
  }
});
