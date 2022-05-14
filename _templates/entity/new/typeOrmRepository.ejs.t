---
to: src/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/infrastructure/persistence/TypeOrm<%= h.changeCase.pascal( h.inflection.singularize(name)) %>Repository.ts 
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { EntitySchema } from 'typeorm';
import { Nullable } from '../../../../shared/domain/Nullable';
import { TypeOrmRepository } from '../../../../shared/infrastructure/persistence/typeorm/TypeOrmRepository';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { <%= h.changeCase.pascal(Singular) %> } from '../../domain/<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>Repository } from '../../domain/<%= h.changeCase.pascal(Singular) %>Repository';
import { <%= h.changeCase.pascal(Singular) %>Entity } from './typeorm/<%= h.changeCase.pascal(Singular) %>Entity';

export class TypeOrm<%= h.changeCase.pascal(Singular) %>Repository extends TypeOrmRepository<<%= h.changeCase.pascal(Singular) %>> implements <%= h.changeCase.pascal(Singular) %>Repository {
  public create(<%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
    return this.insert(<%= h.changeCase.camel(Singular) %>)
  }

  public find(): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>[]>> {
    return this.find()
  }

  public findOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>>> {
      return this.findOne(id)
  }

  public update(id: <%= h.changeCase.pascal(Singular) %>Id, <%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
    return this.insert(<%= h.changeCase.camel(Singular) %>);
  }

  public deleteOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<void> {
    return this.deleteOne(id)
  }

  protected entitySchema(): EntitySchema<<%= h.changeCase.pascal(Singular) %>> {
    return <%= h.changeCase.pascal(Singular) %>Entity;
  }
}
