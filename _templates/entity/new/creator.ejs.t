---
to: src/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/application/<%= h.changeCase.pascal( h.inflection.singularize(name)) %>Creator.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Nullable } from '../../../shared/domain/Nullable';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../shared/domain/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { <%= h.changeCase.pascal(Singular) %> } from '../domain/<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>Repository } from '../domain/<%= h.changeCase.pascal(Singular) %>Repository';
import { Create<%= h.changeCase.pascal(Singular) %>Request } from './Create<%= h.changeCase.pascal(Singular) %>Request';
import { Update<%= h.changeCase.pascal(Singular) %>Request } from './Update<%= h.changeCase.pascal(Singular) %>Request';
import { <%= h.changeCase.pascal(Singular) %>Filter } from '../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Filter';

export class <%= h.changeCase.pascal(Singular) %>Creator {
  private repository: <%= h.changeCase.pascal(Singular) %>Repository;

  constructor(repository: <%= h.changeCase.pascal(Singular) %>Repository) {
    this.repository = repository;
  }

  async get<%= h.changeCase.pascal(Plural) %>(filter: <%= h.changeCase.pascal(Singular) %>Filter): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>[]>> {
    return this.repository.find(filter) || null;
  }

  async get<%= h.changeCase.pascal(Singular) %>(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<Nullable< <%= h.changeCase.pascal(Singular) %> >> {
    return this.repository.findOne(id) || null;
  }

  async insert<%= h.changeCase.pascal(Singular) %>(request: Create<%= h.changeCase.pascal(Singular) %>Request): Promise<void> {
    const <%= h.changeCase.camel(Singular) %> = new <%= h.changeCase.pascal(Singular) %>(
      /* todo: agrega los campos de tu entidad */
    );
    return this.repository.create(<%= h.changeCase.camel(Singular) %>);
  }

  async update<%= h.changeCase.pascal(Singular) %>(request: Update<%= h.changeCase.pascal(Singular) %>Request): Promise<void> {
    const <%= h.changeCase.camel(Singular) %> = new <%= h.changeCase.pascal(Singular) %>(
      /* todo: agrega los campos de tu entidad */
    );
    return this.repository.update(new <%= h.changeCase.pascal(Singular) %>Id(request.id), <%= h.changeCase.camel(Singular) %>);
  }

  async delete<%= h.changeCase.pascal(Singular) %>(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<void> {
    return this.repository.deleteOne(id);
  }
}
