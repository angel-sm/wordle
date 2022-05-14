---
to: src/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/infrastructure/persistence/Mongo<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Repository.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Nullable } from '../../../../shared/domain/Nullable';
import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { <%= h.changeCase.pascal(Singular) %> } from '../../domain/<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>Repository } from '../../domain/<%= h.changeCase.pascal(Singular) %>Repository';
import { <%= h.changeCase.pascal(Singular) %>Filter } from '../../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Filter';
import { DateValueObject } from '../../../../shared/domain/value-object/DateValueObject';

interface <%= h.changeCase.pascal(Singular) %>Document {
  _id: string;
  createdAt: DateValueObject;
  updatedAt: DateValueObject;
  deletedAt: Nullable<DateValueObject>;
  /* todo: agrega los campos de tu entidad */
};

export class Mongo<%= h.changeCase.pascal(Singular) %>Repository extends MongoRepository<<%= h.changeCase.pascal(Singular) %>> implements <%= h.changeCase.pascal(Singular) %>Repository {
  public async findOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>>> {
    const collection = await this.collection();
    const document = await collection.findOne<<%= h.changeCase.pascal(Singular) %>Document>({ _id: id.value });
    
    return document?._id !== undefined ? <%= h.changeCase.pascal(Singular) %>.fromPrimitives({ /* todo: agrega los campos de tu entidad */ }).toPrimitives() : null;
  }

  public async find(filter: <%= h.changeCase.pascal(Singular) %>Filter): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>[]>> {
    const { page, limit } = filter
    const collection = await this.collection();
    const document = await collection.find().skip(((page.value - 1) * limit.value)).limit(limit.value);
    
    return document ? document.toArray() : null;
  }

  public create(<%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
    return this.insert(<%= h.changeCase.camel(Singular) %>)
  }

  public update(id: <%= h.changeCase.pascal(Singular) %>Id, <%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
    return this.updateOne(id.value, <%= h.changeCase.camel(Singular) %>);
  }

  public async deleteOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<void> {
    return this.delete(id.value)
  }

  protected collectionName(): string {
    return '<%= h.changeCase.camel(Plural) %>';
  }
}
