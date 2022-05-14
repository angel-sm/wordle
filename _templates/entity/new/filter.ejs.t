---
to: src/contexts/levita/shared/domain/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Filter.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { PaginationFilters } from "../PaginationFilters";

export interface <%= h.changeCase.pascal(Singular) %>Filter extends PaginationFilters {
}