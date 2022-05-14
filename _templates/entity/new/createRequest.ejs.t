---
to: src/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/application/Create<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Request.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
export type Create<%= h.changeCase.pascal(Singular) %>Request = {
  id?: string;
  /* todo: agrega los campos de tu entidad */
};