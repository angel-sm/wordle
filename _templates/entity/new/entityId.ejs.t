---
to: src/contexts/levita/shared/domain/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Id.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Uuid } from '../../../../shared/domain/value-object/Uuid';

export class <%= h.changeCase.pascal(Singular) %>Id extends Uuid {}
