---
to: src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/domain/<%= h.changeCase.pascal(Singular) %>Repository.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Nullable } from '../../../shared/domain/Nullable';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { <%= h.changeCase.pascal(Singular) %> } from './<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>Filter } from '../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Filter';

export interface <%= h.changeCase.pascal(Singular) %>Repository {
  find(filter: <%= h.changeCase.pascal(Singular) %>Filter): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>[]>>;
  findOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>>>;
  create(<%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void>;
  update(id: <%= h.changeCase.pascal(Singular) %>Id, <%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void>;
  deleteOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<void>;
}