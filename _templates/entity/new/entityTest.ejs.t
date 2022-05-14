---
to: tests/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/domain/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Mother.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { <%= h.changeCase.pascal(Singular) %> } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/domain/<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>WordMother } from './<%= h.changeCase.pascal(Singular) %>WordMother';
import { Create<%= h.changeCase.pascal(Singular) %>Request } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/Create<%= h.changeCase.pascal(Singular) %>Request';

export class <%= h.changeCase.pascal(Singular) %>Mother {
  static create(/* todo: agrega los campos de tu entidad */): <%= h.changeCase.pascal(Singular) %> {
    return new <%= h.changeCase.pascal(Singular) %>(); // todo: agrega los campos de tu entidad
  }

  static fromRequest(request: Create<%= h.changeCase.pascal(Singular) %>Request): <%= h.changeCase.pascal(Singular) %> {
    return this.create(); // todo: agrega los campos de tu entidad
  }

  static generate(): <%= h.changeCase.pascal(Singular) %> {
    return this.create();// todo: agrega los campos de tu entidad
  }
}