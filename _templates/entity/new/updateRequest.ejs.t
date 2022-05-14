---
to: src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/Update<%= h.changeCase.pascal(Singular) %>Request.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
export type Update<%= h.changeCase.pascal(Singular) %>Request = {
  id: string;
  /* todo: agrega los campos de tu entidad */
};