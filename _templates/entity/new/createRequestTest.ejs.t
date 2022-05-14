---
to: tests/contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/Create<%= h.changeCase.pascal(Singular) %>RequestMother.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Create<%= h.changeCase.pascal(Singular) %>Request } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/Create<%= h.changeCase.pascal(Singular) %>Request';
import { <%= h.changeCase.pascal(Singular) %>WordMother } from '../domain/<%= h.changeCase.pascal(Singular) %>WordMother';

export class Create<%= h.changeCase.pascal(Singular) %>RequestMother {
  static create(/* todo: agrega los campos de tu entidad */): Create<%= h.changeCase.pascal(Singular) %>Request {
    return { /* todo: agrega los campos de tu entidad */ };
  }

  static generate(): Create<%= h.changeCase.pascal(Singular) %>Request {
    return this.create(/* todo: agrega los campos de tu entidad */);
  }
}
