---
to: src/contexts/levita/<%= h.changeCase.pascal( h.inflection.pluralize(name)) %>/domain/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { AggregateRoot } from '../../../shared/domain/AggregateRoot';
import { Nullable } from '../../../shared/domain/Nullable';
import { DateValueObject } from '../../../shared/domain/value-object/DateValueObject';
import { Uuid } from '../../../shared/domain/value-object/Uuid';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';

export class <%= h.changeCase.pascal(Singular) %> extends AggregateRoot {
  readonly id: Uuid
  readonly createdAt: DateValueObject;
  readonly updatedAt: DateValueObject;
  readonly deletedAt: Nullable<DateValueObject>;

  constructor(/* todo: agrega los campos de tu entidad */) {
    super();
    this.id = <%= h.changeCase.pascal(Singular) %>Id.generate();
    this.createdAt = new DateValueObject(new Date());
    this.updatedAt = new DateValueObject(new Date());
  }

  static fromPrimitives(plainData: {  /* todo: agrega los campos de tu entidad */ }): <%= h.changeCase.pascal(Singular) %> {
    return new <%= h.changeCase.pascal(Singular) %>(
    );
  }

  toPrimitives(): any {
    return {
      _id: this.id.value,
      createdAt: this.createdAt.value,
      updatedAt: this.updatedAt.value,
      deletedAt: this.deletedAt?.value
    };
  }
}
